import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tanzaniasafari/screens/adventure_details_screen.dart';
import 'package:tanzaniasafari/models/adventure_model.dart'; // Import the correct Adventure class
import 'package:supabase_flutter/supabase_flutter.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  static const routeName = '/trips';

  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  bool _isSearchVisible = false;
  List<Adventure> _adventures = [];
  List<Adventure> _filteredAdventures = [];
  List<Adventure> _culturalExperiences = [];
  List<Adventure> _filteredCulturalExperiences = [];
  List<Adventure> _sightseeing = [];
  List<Adventure> _filteredSightseeing = [];

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchAdventures();
    _fetchCulturalExperiences();
    _fetchSightseeing();
  }

  Future<void> _fetchAdventures() async {
    final client = Supabase.instance.client;
    try {
      final data = await client.from('adventures').select();
      if (data != null) {
        setState(() {
          _adventures = (data as List<dynamic>)
              .map((json) => Adventure.fromMap(json as Map<String, dynamic>))
              .toList();
          _filteredAdventures = _adventures;
        });
      } else {
        _showErrorSnackBar('No adventures found.');
      }
    } catch (error) {
      _showErrorSnackBar('Failed to load adventures: $error');
    }
  }

  Future<void> _fetchCulturalExperiences() async {
    final client = Supabase.instance.client;
    try {
      final data = await client.from('cultural_experiences').select();
      if (data != null) {
        setState(() {
          _culturalExperiences = (data as List<dynamic>)
              .map((json) => Adventure.fromMap(json as Map<String, dynamic>))
              .toList();
          _filteredCulturalExperiences = _culturalExperiences;
        });
      } else {
        _showErrorSnackBar('No cultural experiences found.');
      }
    } catch (error) {
      _showErrorSnackBar('Failed to load cultural experiences: $error');
    }
  }

  Future<void> _fetchSightseeing() async {
    final client = Supabase.instance.client;
    try {
      final data = await client.from('sightseeing').select();
      if (data != null) {
        setState(() {
          _sightseeing = (data as List<dynamic>)
              .map((json) => Adventure.fromMap(json as Map<String, dynamic>))
              .toList();
          _filteredSightseeing = _sightseeing;
        });
      } else {
        _showErrorSnackBar('No sightseeing data found.');
      }
    } catch (error) {
      _showErrorSnackBar('Failed to load sightseeing data: $error');
    }
  }

  void _filterAdventures(String searchText) {
    setState(() {
      searchText = searchText.trim().toLowerCase();
      if (searchText.isEmpty) {
        _filteredAdventures = _adventures;
        _filteredCulturalExperiences = _culturalExperiences;
        _filteredSightseeing = _sightseeing;
      } else {
        _filteredAdventures = _adventures
            .where((adventure) =>
                adventure.title.toLowerCase().contains(searchText) ||
                adventure.location.toLowerCase().contains(searchText))
            .toList();

        _filteredCulturalExperiences = _culturalExperiences
            .where((experience) =>
                experience.title.toLowerCase().contains(searchText) ||
                experience.location.toLowerCase().contains(searchText))
            .toList();

        _filteredSightseeing = _sightseeing
            .where((sight) =>
                sight.title.toLowerCase().contains(searchText) ||
                sight.location.toLowerCase().contains(searchText))
            .toList();
      }
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _navigateToAdventureDetails(Adventure adventure) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AdventureDetailsScreen(adventure: adventure)),
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
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
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
              color: Color.fromARGB(255, 71, 62, 62)),
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
                            labelText: 'Search by title or location'),
                        onChanged: (value) {
                          _filterAdventures(value);
                        },
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
            _buildCarouselGrid(
                _filteredCulturalExperiences, 'Cultural Experiences'),
            _buildCarouselGrid(_filteredSightseeing, 'Sightseeing'),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !_isSearchVisible,
        child: FloatingActionButton(
          onPressed: () {
            _toggleSearchVisibility();
            _scrollToTop();
          },
          child: const Icon(Icons.search),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildCarouselGrid(List<Adventure> items, String categoryTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            categoryTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 250,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
            ),
            items: items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () => _navigateToAdventureDetails(item),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8.0)),
                              child: item.imageUrls != null &&
                                      item.imageUrls.isNotEmpty
                                  ? Image.network(
                                      item.imageUrls.first,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey,
                                          child: const Center(
                                            child: Text(
                                              'Failed to load image',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : Container(
                                      color: Colors.grey,
                                      child: const Center(
                                        child: Text(
                                          'No Image Available',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item.location,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
