import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ZooPage extends StatefulWidget {
  const ZooPage({Key? key}) : super(key: key);

  @override
  _ZooPageState createState() => _ZooPageState();
}

class _ZooPageState extends State<ZooPage> {
  List<Map<String, dynamic>> zoosData = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchZoosData();
  }

  // Fetching zoos data (image_urls, title, location) from Supabase
  Future<void> _fetchZoosData() async {
    final client = Supabase.instance.client;

    try {
      final response = await client
          .from('zoos')
          .select('image_urls, title, location')
          .order('id', ascending: true)
          .limit(10);

      if (response != null && response.isNotEmpty) {
        final List<Map<String, dynamic>> data =
            (response as List<dynamic>).map((zoo) {
          // Handle the image_urls field safely
          var imageUrls = zoo['image_urls'];
          List<dynamic> imagesList;

          if (imageUrls is String) {
            // If it's a string, split by comma to create a list
            imagesList = imageUrls.split(',').map((url) => url.trim()).toList();
          } else if (imageUrls is List) {
            // If it's already a list, just assign it
            imagesList = imageUrls;
          } else {
            // Default to an empty list if the type is unexpected
            imagesList = [];
          }

          return {
            'image_urls': imagesList,
            'title': zoo['title'] as String,
            'location': zoo['location'] as String,
          };
        }).toList();

        setState(() {
          zoosData = data;
        });
      } else {
        throw 'No data available in the zoos table.';
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching zoos data: $err'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      appBar: AppBar(
        title: const Text('Zoos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back navigation
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          const Text(
            'Zoos',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Zoos',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                // Implement your search logic here
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: _buildCarousel(zoosData, 'No zoos available'),
          ),
        ],
      ),
    );
  }

  // A method to build the carousel for zoos
  Widget _buildCarousel(List<Map<String, dynamic>> data, String emptyMessage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.5, // Adjusted height
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
        items: data.isNotEmpty
            ? data.map((item) {
                String imageUrl = (item['image_urls'] != null &&
                        (item['image_urls'] as List).isNotEmpty)
                    ? item['image_urls'][0] as String
                    : 'https://via.placeholder.com/150';

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: const Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            color: Colors.black54,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'] ?? 'No Title',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['location'] ?? 'No Location',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()
            : [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Center(child: Text(emptyMessage)),
                ),
              ],
      ),
    );
  }
}
