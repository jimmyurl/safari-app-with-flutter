import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> _searchResults = [];
  TextEditingController _searchController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text.isNotEmpty) {
      searchResults(_searchController.text);
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  Future<void> searchResults(String query) async {
    final searchQuery = '%$query%';

    try {
      final response = await Future.wait([
        supabase.from('adventures').select().ilike('title', searchQuery),
        supabase.from('zoo').select().ilike('title', searchQuery),
        supabase.from('mountains').select().ilike('title', searchQuery),
        supabase.from('parks').select().ilike('title', searchQuery),
        supabase.from('sightseeing').select().ilike('title', searchQuery),
        supabase
            .from('cultural_experiences')
            .select()
            .ilike('title', searchQuery),
      ]);

      // Debugging: print the response to check if data is fetched
      print('Supabase response: $response');

      final combinedResults =
          response.expand((result) => result as List<dynamic>).toList();

      setState(() {
        _searchResults = combinedResults;
      });

      if (combinedResults.isEmpty) {
        print('No results found for query: $query');
      }
    } catch (e) {
      print('Error fetching search results: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Where Do You Want to Visit?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Search results
            Expanded(
              child: _searchResults.isEmpty
                  ? const Center(child: Text('No results found.'))
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final result = _searchResults[index];
                        return ListTile(
                          title: Text(result['title']),
                          subtitle: Text(result['location'] ?? ''),
                          onTap: () {
                            // Handle tapping a search result
                            print('Tapped on: ${result['title']}');
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
