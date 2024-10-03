import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CultureScreen extends StatefulWidget {
  const CultureScreen({Key? key}) : super(key: key);

  static const routeName = '/culture';

  @override
  _CultureScreenState createState() => _CultureScreenState();
}

class _CultureScreenState extends State<CultureScreen> {
  List<Map<String, dynamic>> clothingData = [];
  List<Map<String, dynamic>> sculpturesData = [];
  List<Map<String, dynamic>> beadworkData = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCultureData();
  }

  // Fetching data from the 'cultures' table based on categories
  Future<void> _fetchCultureData() async {
    final client = Supabase.instance.client;

    try {
      final response = await client
          .from('cultures')
          .select('image_urls, title, location, phone_numbers, category')
          .order('id', ascending: true)
          .limit(100);

      if (response != null && response.isNotEmpty) {
        final List<Map<String, dynamic>> clothing = [];
        final List<Map<String, dynamic>> sculptures = [];
        final List<Map<String, dynamic>> beadwork = [];

        // Grouping data by category
        (response as List<dynamic>).forEach((item) {
          final Map<String, dynamic> cultureItem = {
            'image_urls': item['image_urls'] as List<dynamic>,
            'title': item['title'] as String,
            'location': item['location'] as String,
            'phone_numbers': item['phone_numbers'] as String,
            'category': item['category'] as String,
          };

          switch (item['category']) {
            case 'Clothing':
              clothing.add(cultureItem);
              break;
            case 'Sculptures':
              sculptures.add(cultureItem);
              break;
            case 'Beadwork':
              beadwork.add(cultureItem);
              break;
          }
        });

        setState(() {
          clothingData = clothing;
          sculpturesData = sculptures;
          beadworkData = beadwork;
        });
      } else {
        throw 'No data available in the cultures table.';
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching culture data: $err'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EDDC),
        title: const Text(
          'Culture',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 71, 62, 62),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search Culture',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Clothing',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(clothingData, 'No clothing items available'),
            const SizedBox(height: 20),
            const Text(
              'Sculptures',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(sculpturesData, 'No sculptures available'),
            const SizedBox(height: 20),
            const Text(
              'Beadwork',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(beadworkData, 'No beadwork available'),
          ],
        ),
      ),
    );
  }

  // A method to build the carousel for culture categories (dynamic data from Supabase)
  Widget _buildCarousel(List<Map<String, dynamic>> data, String emptyMessage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.5,
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
                    boxShadow: const [
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
                                const SizedBox(height: 4),
                                Text(
                                  item['phone_numbers'] ??
                                      'No Phone', // Updated to phone_numbers
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
