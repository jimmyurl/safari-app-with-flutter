import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:tanzaniasafari/models/hotel_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:appwrite/appwrite.dart';

class HotelsScreen extends StatefulWidget {
  // final Client client; // Add the client parameter

  const HotelsScreen({Key? key}) : super(key: key);

  static const routeName = '/hotels';

  @override
  _HotelsScreenState createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  String searchText = '';
  bool _isSearchVisible = false;

  List<Hotel> getNorthernCircuitHotels() {
    return Hotel.hotels
        .where((hotel) => hotel.zone.toLowerCase() == 'north')
        .toList();
  }

  List<Hotel> getSouthernCircuitHotels() {
    return Hotel.hotels
        .where((hotel) => hotel.zone.toLowerCase() == 'south')
        .toList();
  }

  @override
  void initState() {
    super.initState();
  }

  void _filterHotels(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _isSearchVisible = false;
      } else {
        _isSearchVisible = true;
      }
    });
  }

  void _navigateToHotelDetails(Hotel hotel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HotelDetailsScreen(hotel: hotel),
      ),
    );
  }

  void _toggleSearchVisibility() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        searchText = '';
        _filterHotels('');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Hotel> northernCircuitHotels = getNorthernCircuitHotels();
    List<Hotel> southernCircuitHotels = getSouthernCircuitHotels();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EDDC),
        title: const Row(
          children: [
            Text(
              'Hotels',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 71, 62, 62),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_isSearchVisible)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      labelText: 'Search by hotel name',
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchText = '';
                          _filterHotels('');
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                    controller: TextEditingController(text: searchText),
                    textInputAction: TextInputAction.search, // Added line
                    textAlign: TextAlign.left, // Added line
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                  ),
                  suggestionsCallback: (pattern) {
                    return Hotel.hotels
                        .where((hotel) =>
                            hotel.title
                                .toLowerCase()
                                .contains(pattern.toLowerCase()) ||
                            hotel.location
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                        .toList();
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.title),
                      subtitle: Text(suggestion.location),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _navigateToHotelDetails(suggestion);
                  },
                ),
              ),
            ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                if (_isSearchVisible)
                  ElevatedButton(
                    onPressed: _toggleSearchVisibility,
                    child: const Text('Cancel'),
                  ),
                if (_isSearchVisible) const SizedBox(height: 16),
                _buildCarouselGrid(
                    northernCircuitHotels, 'Northern Circuit', context),
                const SizedBox(height: 16),
                _buildCarouselGrid(
                    southernCircuitHotels, 'Southern Circuit', context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: !_isSearchVisible,
        child: FloatingActionButton(
          onPressed: _toggleSearchVisibility,
          child: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildCarouselGrid(
      List<Hotel> hotels, String title, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        CarouselSlider(
          options: CarouselOptions(
            height: 250,
            enlargeCenterPage: true,
          ),
          items: hotels.map((hotel) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    _navigateToHotelDetails(hotel);
                  },
                  child: HotelCard(hotel: hotel),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class HotelDetailsScreen extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailsScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF211955),
        title: Text(
          hotel.title,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: hotel.imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8.0),
                      Text(
                        hotel.location,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  hotel.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Amenities:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: hotel.amenities.map((amenity) {
                    return Chip(
                      label: Text(
                        amenity,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      avatar: Icon(
                        getAmenityIcon(amenity),
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Make a Call:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: hotel.phoneNumbers.map((number) {
                    return GestureDetector(
                      onTap: () => _launchPhoneCall(number),
                      child: Text(
                        number,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Perform book action
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String mapsUrl =
                            'https://www.google.com/maps/search/?api=1&query=${hotel.latitude},${hotel.longitude}';
                        if (await canLaunch(mapsUrl)) {
                          await launch(mapsUrl);
                        } else {
                          throw 'Could not launch $mapsUrl';
                        }
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.directions,
                            size: 32.0,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Show Directions',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchPhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

IconData getAmenityIcon(String amenity) {
  switch (amenity.toLowerCase()) {
    case 'wifi in lobby':
    case 'wifi in rooms':
      return Icons.wifi;
    case 'pool':
      return Icons.pool;
    case 'spa':
      return Icons.spa;
    case 'parking':
      return Icons.local_parking;
    default:
      return Icons.info;
  }
}

class LocationOption {
  final String id;
  final String name;

  LocationOption(this.id, this.name);
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9, // Set the desired aspect ratio here
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8.0),
                ),
                child: Image.network(
                  hotel.imageUrls.isNotEmpty ? hotel.imageUrls[0] : '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(hotel.location),
                  const SizedBox(height: 4.0),
                  Text(
                    '${hotel.rating} stars',
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
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
