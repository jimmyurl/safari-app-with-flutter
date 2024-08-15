import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:tanzaniasafari/screens/RoomSelectionPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tanzaniasafari/services/appwrite_services.dart';
import 'package:tanzaniasafari/services/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Hotel> hotels = [];
  final int _numberOfRooms = 0;
  int _selectedNumberOfRooms = 0;
  int _selectedNumberOfAdults = 0;
  int _selectedNumberOfChildren = 0;
  List<Attraction> popularAttractions = [];

  DateTime? _fromDate;
  DateTime? _toDate;
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchPopularAttractions();
  }

  void _fetchPopularAttractions() async {
    try {
      final appwriteService = AppwriteService();
      final attractions = await appwriteService.getAttractions();
      setState(() {
        popularAttractions = attractions;
      });
    } catch (e) {
      print('Error fetching popular attractions: $e');
    }
  }

  int numberOfRooms = 1;
  int numberOfAdults = 1;
  int numberOfChildren = 0;

  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _checkInDateController = TextEditingController();

  String selectedDestination = '';
  String? _destinationError;
  String? _fromDateError;
  String? _toDateError;

  static List<Hotel> getHotelsByLocation(String location, List<Hotel> hotels) {
    final List<Hotel> matchingHotels = hotels
        .where(
            (hotel) => hotel.location.toLowerCase() == location.toLowerCase())
        .toList();
    return matchingHotels;
  }

  void _selectFromDate(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      onConfirm: (date) {
        setState(() {
          _fromDate = date;
          _fromDateController.text = DateFormat('dd-MM-yyyy').format(date);
        });
      },
    );
  }

  void _selectToDate(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: _fromDate != null
          ? _fromDate!.add(const Duration(days: 1))
          : DateTime.now(),
      onConfirm: (date) {
        setState(() {
          _toDate = date;
          _toDateController.text = DateFormat('dd-MM-yyyy').format(date);
        });
      },
    );
  }

  void _updateRoomSelection(
      int numberOfRooms, int numberOfAdults, int numberOfChildren) {
    setState(() {
      _selectedNumberOfRooms = numberOfRooms;
      _selectedNumberOfAdults = numberOfAdults;
      _selectedNumberOfChildren = numberOfChildren;
    });
  }

  void navigateToRoomSelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomSelectionPage(
          numberOfRooms: numberOfRooms,
          numberOfAdults: numberOfAdults,
          numberOfChildren: numberOfChildren,
        ),
      ),
    );
    if (result != null) {
      final int numberOfRooms = result['numberOfRooms'];
      final int numberOfAdults = result['numberOfAdults'];
      final int numberOfChildren = result['numberOfChildren'];
      setState(() {
        this.numberOfRooms = numberOfRooms;
        this.numberOfAdults = numberOfAdults;
        this.numberOfChildren = numberOfChildren;
      });
    }
  }

  @override
  void dispose() {
    _destinationController.dispose();
    _checkInDateController.dispose();
    super.dispose();
  }

  final WeatherService _weatherService =
      WeatherService('YOUR_OPENWEATHERMAP_API_KEY');

  List<WeatherData> weatherDataList = [];

  void _fetchWeatherDataForDestinations(List<Destination> destinations) async {
    for (Destination destination in destinations) {
      String weather = await _weatherService.getWeather(destination.title);
      String imageUrl = await _fetchImageUrlForDestination(destination.title);
      WeatherData weatherData = WeatherData(
        destinationName: destination.title,
        weather: weather,
        imageUrl: imageUrl,
      );
      setState(() {
        weatherDataList.add(weatherData);
      });
    }
  }

  Future<String> _fetchImageUrlForDestination(String destinationName) async {
    // Fetch the image URL for the given destination from your image source (e.g., an API)
    // Replace 'YOUR_IMAGE_API_KEY' and implement the logic to fetch the image URL.
    // For demonstration purposes, we are using a placeholder image URL here.
    return 'https://placekitten.com/200/300'; // Replace with your image URL
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5EDDC),
        appBar: null,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: Text(
                  'Destinations Weather Updates',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                  ),
                  items: weatherDataList.map((weatherData) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(weatherData.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${weatherData.destinationName}\n${weatherData.weather}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Popular Destinations',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 180,
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
                  items: popularAttractions.asMap().entries.map((entry) {
                    int index = entry.key;
                    Attraction destination = entry.value;

                    return GestureDetector(
                      onTap: () {
                        // Handle the tap on the destinationflu
                        // You can add your navigation logic here
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(destination.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              destination.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Destination',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TypeAheadFormField<String>(
                        // Destination selection form field
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _destinationController,
                          decoration: const InputDecoration(
                            hintText: 'Select Destination',
                          ),
                        ),
                        suggestionsCallback: (pattern) async {
                          final List<Hotel> suggestions =
                              getHotelsByLocation(pattern, hotels);
                          final List<String> suggestionLocations = suggestions
                              .map((hotel) => hotel.location)
                              .toList();
                          return suggestionLocations;
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

                            // Fetch hotels based on the selected location
                            List<Hotel> matchingHotels =
                                Hotel.getHotelsByLocation(suggestion, hotels);

                            // Navigate to the HotelsDestination screen with the matching hotels
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HotelsDestination(
                                  destination: suggestion,
                                  hotels: matchingHotels,
                                ),
                              ),
                            );
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a destination';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Check-in Date/Checkout Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _selectFromDate(context);
                              },
                              child: IgnorePointer(
                                child: TextFormField(
                                  // From date selection form field
                                  controller: _fromDateController,
                                  decoration: const InputDecoration(
                                    hintText: 'Select From Date',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _selectToDate(context);
                              },
                              child: IgnorePointer(
                                child: TextFormField(
                                  // To date selection form field
                                  controller: _toDateController,
                                  decoration: const InputDecoration(
                                    hintText: 'Select To Date',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const SizedBox(height: 8.0),
                      const Row(
                        children: [
                          Text(
                            'Number of Rooms',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () async {
                              final Map<String, int> result =
                                  await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RoomSelectionPage(
                                    numberOfRooms: numberOfRooms,
                                    numberOfAdults: numberOfAdults,
                                    numberOfChildren: numberOfChildren,
                                  ),
                                ),
                              );
                              setState(() {
                                numberOfRooms =
                                    result['numberOfRooms'] ?? numberOfRooms;
                                numberOfAdults =
                                    result['numberOfAdults'] ?? numberOfAdults;
                                numberOfChildren = result['numberOfChildren'] ??
                                    numberOfChildren;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Rooms',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  '$numberOfRooms Room(s)',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  '$numberOfAdults Adult(s), $numberOfChildren Child',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectedDestination.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HotelsDestination(
                                    destination: selectedDestination,
                                    hotels: const [],
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text('Search'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Signup / Login',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle sign up or log in button press
                          },
                          child: const Text('Signup / Login'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Or sign-in with:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle sign in with Gmail
                              },
                              child: Image.asset(
                                'assets/images/gmail-logo.png', // Replace with your Gmail logo asset
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            GestureDetector(
                              onTap: () {
                                // Handle sign in with Facebook
                              },
                              child: Image.asset(
                                'assets/images/facebook.png', // Replace with your Facebook logo asset
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hotel {
  final String name;
  final int price;
  final List<String> imageUrls;
  final String hotelDestination;
  final String location;
  final String hotelClass; // Add this property

  Hotel({
    required this.name,
    required this.price,
    required this.imageUrls,
    required this.hotelDestination,
    required this.location,
    required this.hotelClass,
  });

  static List<Hotel> getHotelsByLocation(String location, List<Hotel> hotels) {
    final List<Hotel> matchingHotels = hotels
        .where(
            (hotel) => hotel.location.toLowerCase() == location.toLowerCase())
        .toList();
    return matchingHotels;
  }
}

class WeatherData {
  final String destinationName;
  final String weather;
  final String imageUrl;

  WeatherData({
    required this.destinationName,
    required this.weather,
    required this.imageUrl,
  });
}

class WeatherService {
  final String apiKey;

  WeatherService(this.apiKey);

  Future<String> getWeather(String city) async {
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body);
        final String weatherDescription =
            weatherData['weather'][0]['description'];
        return weatherDescription;
      } else {
        return 'Weather data not available';
      }
    } catch (e) {
      return 'Error fetching weather data';
    }
  }
}

class HotelsDestination extends StatefulWidget {
  final String destination;
  final List<Hotel> hotels;

  const HotelsDestination({
    Key? key,
    required this.destination,
    required this.hotels,
  }) : super(key: key);

  @override
  _HotelsDestinationState createState() => _HotelsDestinationState();
}

class _HotelsDestinationState extends State<HotelsDestination> {
  String selectedDestination = '';
  List<Hotel> filteredHotels = [];

  void _searchHotels() {
    setState(() {
      filteredHotels = widget.hotels.where((hotel) {
        return hotel.hotelDestination
            .toLowerCase()
            .contains(selectedDestination.toLowerCase());
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredHotels = widget.hotels; // Populate the initial list with all hotels
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels in ${widget.destination}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  selectedDestination = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Destination',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchHotels,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredHotels.length,
              itemBuilder: (context, index) {
                final hotel = filteredHotels[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          hotel.imageUrls[0],
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                        ListTile(
                          title: Text(hotel.name),
                          subtitle: Text('Price: \$${hotel.price} per night'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle price range button
                              },
                              child: const Text('Price Range'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle view more pictures button
                              },
                              child: const Text('View More Pictures'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle book button
                              },
                              child: const Text('Book'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Destination {
  final String imageUrl;
  final String title;
  final String location;

  Destination({
    required this.imageUrl,
    required this.title,
    required this.location,
  });
}

class Activity {
  final String title;
  final String description;
  // Add other properties as needed

  Activity({
    required this.title,
    required this.description,
    // Initialize other properties here
  });
}
