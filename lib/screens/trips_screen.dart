import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  List<Map<String, dynamic>> adventuresData = [];
  List<Map<String, dynamic>> culturalExperiencesData = [];
  List<Map<String, dynamic>> sightseeingData = [];

  @override
  void initState() {
    super.initState();
    _fetchAdventuresData();
    _fetchCulturalExperiencesData();
    _fetchSightseeingData();
  }

  // Fetching adventures data (image_urls, title, location) from Supabase
  Future<void> _fetchAdventuresData() async {
    final client = Supabase.instance.client;

    try {
      final response = await client
          .from('adventures')
          .select('image_urls, title, location')
          .order('id', ascending: true)
          .limit(10);

      if (response != null && response.isNotEmpty) {
        final List<Map<String, dynamic>> data = (response as List<dynamic>)
            .map((trip) => {
                  'image_urls': trip['image_urls'] as List<dynamic>,
                  'title': trip['title'] as String,
                  'location': trip['location'] as String,
                })
            .toList();

        setState(() {
          adventuresData = data;
        });
      } else {
        throw 'No data available in the adventures table.';
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching adventures data: $err'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  // Fetching cultural experiences data (image_urls, title, location) from Supabase
  Future<void> _fetchCulturalExperiencesData() async {
    final client = Supabase.instance.client;

    try {
      final response = await client
          .from('cultural_experiences')
          .select('image_urls, title, location')
          .order('id', ascending: true)
          .limit(10);

      if (response != null && response.isNotEmpty) {
        final List<Map<String, dynamic>> data = (response as List<dynamic>)
            .map((trip) => {
                  'image_urls': trip['image_urls'] as List<dynamic>,
                  'title': trip['title'] as String,
                  'location': trip['location'] as String,
                })
            .toList();

        setState(() {
          culturalExperiencesData = data;
        });
      } else {
        throw 'No data available in the cultural experiences table.';
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching cultural experiences data: $err'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  // Fetching sightseeing data (image_urls, title, location) from Supabase
  Future<void> _fetchSightseeingData() async {
    final client = Supabase.instance.client;

    try {
      final response = await client
          .from('sightseeing')
          .select('image_urls, title, location')
          .order('id', ascending: true)
          .limit(10);

      if (response != null && response.isNotEmpty) {
        final List<Map<String, dynamic>> data = (response as List<dynamic>)
            .map((trip) => {
                  'image_urls': trip['image_urls'] as List<dynamic>,
                  'title': trip['title'] as String,
                  'location': trip['location'] as String,
                })
            .toList();

        setState(() {
          sightseeingData = data;
        });
      } else {
        throw 'No data available in the sightseeing table.';
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching sightseeing data: $err'),
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
            const SizedBox(height: 4.0),
            const Text(
              'Adventures',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(adventuresData, 'No adventures available'),
            const SizedBox(height: 10.0),
            const Text(
              'Cultural Experiences',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(
                culturalExperiencesData, 'No cultural experiences available'),
            const SizedBox(height: 10.0),
            const Text(
              'Sightseeing',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildCarousel(sightseeingData, 'No sightseeing available'),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  // A method to build the carousel for each category
  Widget _buildCarousel(List<Map<String, dynamic>> data, String emptyMessage) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      elevation: 4,
      child: Container(
        height:
            MediaQuery.of(context).size.height * 0.4, // Further reduced height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item['title'] ?? 'No Title',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['location'] ?? 'No Location',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
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
            ),
          ],
        ),
      ),
    );
  }
}
