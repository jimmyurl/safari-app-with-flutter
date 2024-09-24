import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tanzaniasafari/main.dart';

class ZooPage extends StatefulWidget {
  const ZooPage({Key? key}) : super(key: key);

  @override
  _ZooPageState createState() => _ZooPageState();
}

class _ZooPageState extends State<ZooPage> {
  List<Map<String, dynamic>> _attractions = [];
  List<Map<String, dynamic>> _filteredAttractions = [];
  String _searchQuery = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAttractions();
  }

  Future<void> _fetchAttractions() async {
    final client = Supabase.instance.client;

    try {
      final response = await client.from('zoo').select().limit(100);

      if (response != null) {
        setState(() {
          _attractions = List<Map<String, dynamic>>.from(response);
          _filteredAttractions = _attractions;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching attractions.'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching attractions: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching attractions: $error'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _filterAttractions(String query) {
    setState(() {
      _searchQuery = query;
      _filteredAttractions = _attractions
          .where((attraction) =>
              attraction['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoo'),
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
              onChanged: _filterAttractions,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Discover the Zoo!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView(
                      children: _filteredAttractions.map((attraction) {
                        return _buildAttractionCard(
                          attraction['title'],
                          attraction['imagePath'],
                          attraction['description'],
                          context,
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttractionCard(String title, String imagePath,
      String description, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading:
            Image.network(imagePath, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: () {
          // Handle tap on the card
        },
      ),
    );
  }
}
