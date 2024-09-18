import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ParksPage extends StatefulWidget {
  const ParksPage({Key? key}) : super(key: key);

  @override
  _ParksPageState createState() => _ParksPageState();
}

class _ParksPageState extends State<ParksPage> {
  List<Map<String, dynamic>> _Parks = [];
  List<Map<String, dynamic>> _filteredParks = [];
  String _searchQuery = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchParks();
  }

  Future<void> _fetchParks() async {
    final client = Supabase.instance.client;

    try {
      final response = await client.from('parks').select().limit(100);

      if (response != null) {
        setState(() {
          _Parks = List<Map<String, dynamic>>.from(response);
          _filteredParks = _Parks;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching Parks.'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching Parks: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching Parks: $error'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _filterParks(String query) {
    setState(() {
      _searchQuery = query;
      _filteredParks = _Parks.where((mountain) =>
              mountain['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parks'),
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
              onChanged: _filterParks,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Explore the Parks!',
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
                      itemCount: _filteredParks.length,
                      itemBuilder: (context, index) {
                        final mountain = _filteredParks[index];
                        return _buildMountainCard(
                          mountain['title'],
                          mountain['imagePath'],
                          mountain['location'],
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

  Widget _buildMountainCard(
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
