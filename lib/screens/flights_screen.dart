import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FlightsScreen extends StatefulWidget {
  const FlightsScreen({Key? key}) : super(key: key);

  static const routeName = '/flights';

  @override
  _FlightsScreenState createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen> {
  List<Map<String, dynamic>> northernCircuitData = [];
  List<Map<String, dynamic>> southernCircuitData = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTransportData();
  }

  Future<void> _fetchTransportData() async {
    final client = Supabase.instance.client;

    try {
      final response = await client
          .from('transports')
          .select('image_urls, title, location, phone_numbers, circuit')
          .order('id', ascending: true);

      if (response != null && response.isNotEmpty) {
        final List<Map<String, dynamic>> northern = [];
        final List<Map<String, dynamic>> southern = [];

        (response as List<dynamic>).forEach((item) {
          final Map<String, dynamic> transportItem = {
            'image_urls': item['image_urls'] as List<dynamic>,
            'title': item['title'] as String,
            'location': item['location'] as String,
            'phone_numbers': item['phone_numbers'] as String,
            'circuit': item['circuit'] as String,
          };

          if (item['circuit'] == 'Northern') {
            northern.add(transportItem);
          } else if (item['circuit'] == 'Southern') {
            southern.add(transportItem);
          }
        });

        setState(() {
          northernCircuitData = northern;
          southernCircuitData = southern;
        });
      } else {
        throw 'No data available in the transports table.';
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching transport data: $err'),
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
          'Transportations',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search Transportation',
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
              'Northern Circuit',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(northernCircuitData,
                'No northern circuit transports available'),
            const SizedBox(height: 20),
            const Text(
              'Southern Circuit',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(southernCircuitData,
                'No southern circuit transports available'),
          ],
        ),
      ),
    );
  }

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
                                  item['phone_numbers'] ?? 'No Phone',
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
