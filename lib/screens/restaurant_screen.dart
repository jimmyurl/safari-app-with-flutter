import 'package:flutter/material.dart';
import 'package:tanzaniasafari/screens/restaurant_details_screen.dart';
import 'package:tanzaniasafari/models/restaurant_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class RestaurantsScreen extends StatefulWidget {
  // final Client client; // Add the client parameter

  const RestaurantsScreen({Key? key}) : super(key: key);

  static const routeName = '/restaurants';

  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  bool _isSearchVisible = false;
  List<Restaurant> _filteredClothingRestaurants = [];
  List<Restaurant> _filteredSculpturesRestaurants = [];
  List<Restaurant> _filteredBeadworkRestaurants = [];
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _filteredClothingRestaurants = Restaurant.clothingRestaurants;
    _filteredSculpturesRestaurants = Restaurant.sculpturesRestaurants;
    _filteredBeadworkRestaurants = Restaurant.beadworkRestaurants;
  }

  void _filterRestaurants(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredClothingRestaurants = Restaurant.clothingRestaurants;
        _filteredSculpturesRestaurants = Restaurant.sculpturesRestaurants;
        _filteredBeadworkRestaurants = Restaurant.beadworkRestaurants;
      } else {
        searchText = searchText.trim().toLowerCase();
        _filteredClothingRestaurants = Restaurant.clothingRestaurants
            .where((restaurant) =>
                restaurant.title.toLowerCase().contains(searchText))
            .toList();
        _filteredSculpturesRestaurants = Restaurant.sculpturesRestaurants
            .where((restaurant) =>
                restaurant.title.toLowerCase().contains(searchText))
            .toList();
        _filteredBeadworkRestaurants = Restaurant.beadworkRestaurants
            .where((restaurant) =>
                restaurant.title.toLowerCase().contains(searchText))
            .toList();
      }
    });
  }

  void _navigateToRestaurantDetails(Restaurant restaurant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestaurantDetailsScreen(
          restaurant: restaurant,
        ),
      ),
    );
  }

  void _toggleSearchVisibility() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        _searchController.clear();
        _filterRestaurants('');
      }
    });

    if (!_isSearchVisible) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
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
      body: Column(
        children: [
          if (_isSearchVisible)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TypeAheadField<Restaurant>(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Search by title',
                        ),
                      ),
                      suggestionsCallback: (searchText) {
                        searchText = searchText.trim().toLowerCase();
                        final List<Restaurant> suggestions = [];

                        // Add suggestions from clothing restaurants
                        suggestions.addAll(_filteredClothingRestaurants.where(
                            (restaurant) => restaurant.title
                                .toLowerCase()
                                .contains(searchText)));

                        // Add suggestions from sculptures restaurants
                        suggestions.addAll(_filteredSculpturesRestaurants.where(
                            (restaurant) => restaurant.title
                                .toLowerCase()
                                .contains(searchText)));

                        // Add suggestions from beadwork restaurants
                        suggestions.addAll(_filteredBeadworkRestaurants.where(
                            (restaurant) => restaurant.title
                                .toLowerCase()
                                .contains(searchText)));

                        return suggestions;
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion.title),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        _searchController.text = suggestion.title;
                        _filterRestaurants(suggestion.title);
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _searchController.clear();
                      _filterRestaurants('');
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
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: 3, // Number of carousel grids
              itemBuilder: (context, index) {
                String carouselTitle = '';
                List<Restaurant> carouselRestaurants = [];

                if (index == 0) {
                  carouselTitle = 'Clothing';
                  carouselRestaurants = _filteredClothingRestaurants;
                } else if (index == 1) {
                  carouselTitle = 'Sculptures';
                  carouselRestaurants = _filteredSculpturesRestaurants;
                } else if (index == 2) {
                  carouselTitle = 'Beadwork';
                  carouselRestaurants = _filteredBeadworkRestaurants;
                }

                return Column(
                  children: [
                    if (index > 0) const SizedBox(height: 16),
                    _buildCarouselGrid(
                        carouselRestaurants, carouselTitle, context),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleSearchVisibility,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildCarouselGrid(
    List<Restaurant> restaurants,
    String title,
    BuildContext context,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        CarouselSlider(
          options: CarouselOptions(
            height: 250,
            enlargeCenterPage: true,
          ),
          items: restaurants.map((restaurant) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailsScreen(
                          restaurant: restaurant,
                        ),
                      ),
                    );
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
                                restaurant.imageUrls.first,
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
                                  restaurant.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on),
                                    const SizedBox(width: 4),
                                    Text(restaurant.location),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.phone),
                                    const SizedBox(width: 4),
                                    Text(restaurant.phoneNumbers.join(', ')),
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
