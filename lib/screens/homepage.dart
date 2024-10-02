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
  List<Map<String, String>> popularDestinations = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchPopularDestinations();
  }

  Future<void> _fetchPopularDestinations() async {
    final client = Supabase.instance.client;

    try {
      final response = await client
          .from('popular_destinations')
          .select('image_url, title, location')
          .order('id', ascending: true)
          .limit(10);

      if (response != null && response.isNotEmpty) {
        final List<Map<String, String>> destinations =
            (response as List<dynamic>).map((destination) {
          return {
            'image_url': destination['image_url'] as String,
            'title': destination['title'] as String,
            'location': destination['location'] as String,
          };
        }).toList();

        setState(() {
          popularDestinations = destinations;
        });
      } else {
        throw 'No data available in the table.';
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching popular destinations: $err'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
    });
    // Implement search functionality here, e.g., filtering locations.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(), // Header with icons
            const SizedBox(height: 8.0), // Reduced height for spacing
            _buildSearchBar(), // Search bar immediately after header
            const SizedBox(height: 16.0), // Reduced height for spacing
            _buildPopularDestinations(), // Carousel of popular destinations
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search for attractions...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconWithLabel(
                  context, 'assets/icons/zoo.png', 'Zoo', const ZooPage()),
              _buildSpacer(),
              _buildIconWithLabel(context, 'assets/icons/waterfall.png',
                  'Waterfall', const WaterfallsPage()),
              _buildSpacer(),
              _buildIconWithLabel(context, 'assets/icons/mountain.png',
                  'Mountains', const MountainsPage()),
              _buildSpacer(),
              _buildIconWithLabel(context, 'assets/icons/parks.png', 'Parks',
                  const ParksPage()),
              _buildSpacer(),
              _buildIconWithLabel(context, 'assets/icons/reserves.png',
                  'Reserves', const ReservesPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularDestinations() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Destinations',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0), // Spacing between text and carousel
          Container(
            height: 400, // Increased height to fully utilize the space
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                height: 400, // Set the same height for the carousel
              ),
              items: popularDestinations.isNotEmpty
                  ? popularDestinations.map((destination) {
                      return _buildDestinationCard(destination);
                    }).toList()
                  : [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: const Center(child: Text('No images available')),
                      )
                    ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(Map<String, String> destination) {
    String imageUrl =
        destination['image_url'] ?? 'https://via.placeholder.com/150';

    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 8.0), // Removed vertical margin
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Make the card rounded
      ),
      child: Container(
        height: 400, // Expand the card height to fit content properly
        child: Stack(
          // Use Stack to overlay text on top of the image
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(15.0), // Match the border radius
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover, // Ensure the image covers the entire area
                height: double.infinity, // Fill the entire card height
                width: double.infinity, // Fill the entire card width
              ),
            ),
            Positioned(
              bottom: 20, // Position text above the bottom to ensure visibility
              left: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(
                      0.5), // Transparent background for text readability
                  borderRadius:
                      BorderRadius.circular(10), // Slight curve for text box
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination['title'] ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 20, // Increased font size for title
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // White text for contrast against image
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      destination['location'] ?? 'No Location',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors
                            .white, // White text for contrast against image
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
  }

  Widget _buildIconWithLabel(
      BuildContext context, String iconPath, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 20, height: 20),
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
