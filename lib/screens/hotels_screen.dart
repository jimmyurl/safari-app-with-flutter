import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  _HotelsScreenState createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  List<Map<String, dynamic>> hotelsData = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchHotelsData();
  }

  // Fetching hotels data (image_urls, title, location) from Supabase
  Future<void> _fetchHotelsData() async {
    final client = Supabase.instance.client;

    try {
      final response = await client
          .from('hotels')
          .select('image_urls, title, location')
          .order('id', ascending: true)
          .limit(10);

      if (response != null && response.isNotEmpty) {
        final List<Map<String, dynamic>> data = (response as List<dynamic>)
            .map((hotel) => {
                  'image_urls': hotel['image_urls'] as List<dynamic>,
                  'title': hotel['title'] as String,
                  'location': hotel['location'] as String,
                })
            .toList();

        setState(() {
          hotelsData = data;
        });
      } else {
        throw 'No data available in the hotels table.';
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching hotels data: $err'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero, // Remove padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search Hotels',
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
            const Text(
              'Hotels',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(hotelsData, 'No hotels available'),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  // A method to build the carousel for hotels
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
                        offset: Offset(0, 4),
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
