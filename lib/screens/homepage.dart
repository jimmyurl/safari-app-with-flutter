import 'package:flutter/material.dart';
import 'package:tanzaniasafari/models/hotel_model.dart' as hotelModel;
import 'package:tanzaniasafari/screens/HotelsDestination.dart'
    as destinationScreen;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tanzaniasafari/screens/zoo_page.dart';
import 'package:tanzaniasafari/screens/reserves_page.dart';
import 'package:tanzaniasafari/screens/parks_page.dart';
import 'package:tanzaniasafari/screens/waterfall_page.dart';
import 'package:tanzaniasafari/screens/mountains_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> popularDestinationsImages = [];

  @override
  void initState() {
    super.initState();
    _fetchPopularDestinationsImages();
  }

  // Fetching popular destinations images from Supabase without using deprecated execute() method
  Future<void> _fetchPopularDestinationsImages() async {
    final client = Supabase.instance.client;

    try {
      // Fetching data directly from the 'popular_destinations' table using select() method
      final response = await client
          .from('popular_destinations') // Replace with your actual table name
          .select('image_url') // Selecting only the image_url field
          .order('id', ascending: true) // Order results by ID, optional
          .limit(10); // Optional: Limiting the results to 10

      if (response != null && response.isNotEmpty) {
        final List<String> imageUrls = (response as List<dynamic>)
            .map((destination) => destination['image_url'] as String)
            .toList();

        // Debugging output
        print("Fetched image URLs from table: $imageUrls");

        // Update the state to display the images
        setState(() {
          popularDestinationsImages = imageUrls;
        });
      } else {
        throw 'No data available in the table.';
      }
    } catch (err) {
      // Handle errors properly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching popular destinations: $err'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIconWithLabel(context, 'assets/icons/zoo.png',
                          'Zoo', const ZooPage()),
                      _buildSpacer(),
                      _buildIconWithLabel(context, 'assets/icons/waterfall.png',
                          'Waterfall', const WaterfallsPage()),
                      _buildSpacer(),
                      _buildIconWithLabel(context, 'assets/icons/mountain.png',
                          'Mountains', const MountainsPage()),
                      _buildSpacer(),
                      _buildIconWithLabel(context, 'assets/icons/parks.png',
                          'Parks', const ParksPage()),
                      _buildSpacer(),
                      _buildIconWithLabel(context, 'assets/icons/reserves.png',
                          'Reserves', const ReservesPage()),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Popular Destinations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 4,
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.6, // Set height to occupy more space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 10),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                        ),
                        items: popularDestinationsImages.isNotEmpty
                            ? popularDestinationsImages.map((imageUrl) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList()
                            : [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: const Center(
                                      child: Text('No images available')),
                                ),
                              ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(
      BuildContext context, String iconPath, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 20,
            height: 20,
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildSpacer() {
    return const SizedBox(width: 16.0);
  }
}
