import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  List<hotelModel.Hotel> popularDestinations = [];
  final TextEditingController _destinationController = TextEditingController();
  String selectedDestination = '';
  bool isLoginMode = true;

  @override
  void initState() {
    super.initState();
    _fetchPopularDestinations();
  }

  Future<void> _fetchPopularDestinations() async {
    final client = Supabase.instance.client;

    try {
      final response = await client.from('hotels').select().maybeSingle();

      if (response != null) {
        final List<dynamic> responseData = response as List<dynamic>;

        final List<hotelModel.Hotel> hotels =
            responseData.map<hotelModel.Hotel>((json) {
          return hotelModel.Hotel(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String,
            imageUrls: List<String>.from(json['imageUrls'] as List),
            rating: (json['rating'] as num).toDouble(),
            location: json['location'] as String,
            zone: json['zone'] as String,
            hotelClass: json['hotelClass'] as String,
            amenities: List<String>.from(json['amenities'] as List),
            phoneNumbers: List<String>.from(json['phoneNumbers'] as List),
            latitude: (json['latitude'] as num).toDouble(),
            longitude: (json['longitude'] as num).toDouble(),
          );
        }).toList();

        setState(() {
          popularDestinations = hotels;
        });
      }
    } catch (err) {
      print('Error: $err');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching destinations: $err'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 200,
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
                      items: popularDestinations.map((destination) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                  destination.imageUrls.isNotEmpty
                                      ? destination.imageUrls[0]
                                      : 'https://example.com/placeholder.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black.withOpacity(0.5),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        destination.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        destination.location,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Search for Attractions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TypeAheadFormField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _destinationController,
                        decoration: const InputDecoration(
                          hintText: 'Select Destination',
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return popularDestinations
                            .where((hotel) => hotel.location
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .map((hotel) => hotel.location)
                            .toList();
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        setState(() {
                          selectedDestination = suggestion;
                          _destinationController.text = suggestion;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedDestination.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  destinationScreen.HotelsDestination(
                                destination: selectedDestination,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a destination.'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                        }
                      },
                      child: const Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      isLoginMode ? 'Login' : 'Sign Up',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    if (!isLoginMode) const SizedBox(height: 8.0),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle login or sign-up logic
                      },
                      child: Text(isLoginMode ? 'Login' : 'Sign Up'),
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLoginMode = !isLoginMode;
                        });
                      },
                      child: Text(isLoginMode
                          ? 'Need an account? Sign Up'
                          : 'Already have an account? Login'),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Gmail login
                      },
                      child: const Text('Login with Gmail'),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Image.asset(
            iconPath,
            height: 20,
            width: 20,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpacer() {
    return const SizedBox(width: 16.0);
  }
}
