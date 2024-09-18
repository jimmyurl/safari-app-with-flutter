import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReservesPage extends StatefulWidget {
  const ReservesPage({Key? key}) : super(key: key);

  @override
  _ReservesPageState createState() => _ReservesPageState();
}

class _ReservesPageState extends State<ReservesPage> {
  List<Map<String, dynamic>> _Reserves = [];
  List<Map<String, dynamic>> _filteredReserves = [];
  String _searchQuery = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchReserves();
  }

  Future<void> _fetchReserves() async {
    final client = Supabase.instance.client;

    try {
      final response = await client.from('reserves').select().limit(100);

      if (response != null) {
        setState(() {
          _Reserves = List<Map<String, dynamic>>.from(response);
          _filteredReserves = _Reserves;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching Reserves.'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching Reserves: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching Reserves: $error'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _filterReserves(String query) {
    setState(() {
      _searchQuery = query;
      _filteredReserves = _Reserves.where((mountain) =>
              mountain['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserves'),
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
              onChanged: _filterReserves,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Explore the Reserves!',
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
                      itemCount: _filteredReserves.length,
                      itemBuilder: (context, index) {
                        final mountain = _filteredReserves[index];
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
