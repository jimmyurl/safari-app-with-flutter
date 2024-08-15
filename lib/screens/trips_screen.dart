import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tanzaniasafari/screens/adventure_details_screen.dart';
import 'package:tanzaniasafari/models/adventure_model.dart';
import 'package:appwrite/appwrite.dart';
import 'package:tanzaniasafari/services/appwrite_services.dart';

class TripsScreen extends StatefulWidget {
  //final Client client; // Add the client parameter
  const TripsScreen({Key? key}) : super(key: key);
  static const routeName = '/trips';

  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  String searchText = '';
  bool _isSearchVisible = false;

  final List<Adventure> _adventures = const Adventure(
    id: '1',
    title: 'Sample Adventure',
    description: 'This is a sample adventure.',
    imageUrls: ['https://example.com/image.jpg'],
    price: 0.0,
    rating: 0.0,
    morePicturesUrls: [],
    location: '',
    phoneNumbers: [],
    latitude: 0.0,
    longitude: 0.0,
  ).getAdventures();
  final List<Adventure> _culturalExperiences = const Adventure(
    id: '1',
    title: 'Sample Adventure',
    description: 'This is a sample adventure.',
    imageUrls: ['https://example.com/image.jpg'],
    price: 0.0,
    rating: 0.0,
    morePicturesUrls: [],
    location: '',
    phoneNumbers: [],
    latitude: 0.0,
    longitude: 0.0,
  ).getCulturalExperiences();
  final List<Adventure> _sightseeing = const Adventure(
    id: '1',
    title: 'Sample Adventure',
    description: 'This is a sample adventure.',
    imageUrls: ['https://example.com/image.jpg'],
    price: 0.0,
    rating: 0.0,
    morePicturesUrls: [],
    phoneNumbers: [],
    location: '',
    latitude: 0.0,
    longitude: 0.0,
  ).getSightseeing();
  List<Adventure> _filteredAdventures = [];
  List<Adventure> _filteredCulturalExperiences = [];
  List<Adventure> _filteredSightseeing = [];
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _filteredAdventures = _adventures;
    _filteredCulturalExperiences = _culturalExperiences;
    _filteredSightseeing = _sightseeing;
  }

  void _filterAdventures(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredAdventures = _adventures;
        _filteredCulturalExperiences = _culturalExperiences;
        _filteredSightseeing = _sightseeing;
      } else {
        searchText = searchText.trim(); // Trim the search text
        _filteredAdventures = _adventures
            .where((adventure) =>
                adventure.title
                    .toLowerCase()
                    .contains(searchText.toLowerCase()) ||
                adventure.location
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
            .toList();

        _filteredCulturalExperiences = _culturalExperiences
            .where((adventure) =>
                adventure.title
                    .toLowerCase()
                    .contains(searchText.toLowerCase()) ||
                adventure.location
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
            .toList();

        _filteredSightseeing = _sightseeing
            .where((adventure) =>
                adventure.title
                    .toLowerCase()
                    .contains(searchText.toLowerCase()) ||
                adventure.location
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
            .toList();
      }
    });

    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToAdventureDetails(Adventure adventure) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdventureDetailsScreen(adventure: adventure),
      ),
    );
  }

  void _toggleSearchVisibility() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        _searchController.clear();
        _filterAdventures('');
      }
    });

    if (!_isSearchVisible) {
      // Scroll to the top of the page
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EDDC),
        title: const Text(
          'Karibu Tanzania',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 71, 62, 62),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            if (_isSearchVisible)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Search by title or location',
                        ),
                        onChanged: (value) {
                          _filterAdventures(value);
                        },
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _searchController.clear();
                        _filterAdventures('');
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ],
                ),
              ),
            if (_isSearchVisible)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _toggleSearchVisibility,
                  child: const Text('Cancel'),
                ),
              ),
            if (_isSearchVisible) const SizedBox(height: 16),
            _buildCarouselGrid(_filteredAdventures, 'Adventures'),
            if (_isSearchVisible) const SizedBox(height: 16),
            _buildCarouselGrid(
                _filteredCulturalExperiences, 'Cultural Experiences'),
            if (_isSearchVisible) const SizedBox(height: 16),
            _buildCarouselGrid(_filteredSightseeing, 'Sightseeing'),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !_isSearchVisible,
        child: FloatingActionButton(
          onPressed: () {
            _toggleSearchVisibility();
            // Scroll to top when FAB is pressed
            _scrollToTop();
          },
          child: const Icon(Icons.search),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildCarouselGrid(List<Adventure> adventures, String categoryTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            categoryTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        CarouselSlider(
          options: CarouselOptions(
            height: 250,
            enlargeCenterPage: true,
          ),
          items: adventures.map((adventure) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    _navigateToAdventureDetails(adventure);
                  },
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150, // Set a fixed height for the image
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8.0),
                              ),
                              child: Image.network(
                                adventure.imageUrls.first,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  adventure.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      adventure.location,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.phone, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      adventure.phoneNumbers.join(", "),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
