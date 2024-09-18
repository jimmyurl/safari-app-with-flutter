import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WaterfallsPage extends StatefulWidget {
  const WaterfallsPage({Key? key}) : super(key: key);

  @override
  _WaterfallsPageState createState() => _WaterfallsPageState();
}

class _WaterfallsPageState extends State<WaterfallsPage> {
  List<Map<String, dynamic>> _waterfalls = [];
  List<Map<String, dynamic>> _filteredWaterfalls = [];
  String _searchQuery = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWaterfalls();
  }

  Future<void> _fetchWaterfalls() async {
    final client = Supabase.instance.client;

    try {
      final response = await client.from('waterfalls').select().limit(100);

      if (response != null) {
        setState(() {
          _waterfalls = List<Map<String, dynamic>>.from(response);
          _filteredWaterfalls = _waterfalls;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching waterfalls.'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching waterfalls: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching waterfalls: $error'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _filterWaterfalls(String query) {
    setState(() {
      _searchQuery = query;
      _filteredWaterfalls = _waterfalls
          .where((waterfall) =>
              waterfall['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waterfalls'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _filterWaterfalls,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Explore the Waterfalls!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: _filteredWaterfalls.length,
                      itemBuilder: (context, index) {
                        final waterfall = _filteredWaterfalls[index];
                        return _buildWaterfallCard(
                          waterfall['title'],
                          waterfall['imagePath'],
                          waterfall['location'],
                          context,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildWaterfallCard(
      String title, String imagePath, String location, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading:
            Image.network(imagePath, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(location),
        onTap: () {
          // Handle tap on the card
        },
      ),
    );
  }
}
