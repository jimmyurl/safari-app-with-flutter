import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tanzaniasafari/screens/flight_details_screen.dart';
import 'package:tanzaniasafari/models/flight_model.dart';
import 'package:tanzaniasafari/screens/flights_search_results_screen.dart';

class FlightsScreen extends StatefulWidget {
  const FlightsScreen({Key? key}) : super(key: key);
  static const routeName = '/flights';

  @override
  _FlightsScreenState createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen> {
  String searchText = '';
  List<Flight> northernCircuitFlights = Flight.northernCircuitFlights;
  List<Flight> southernCircuitFlights = Flight.southernCircuitFlights;
  List<Flight> displayedFlights = [];
  final ScrollController _scrollController = ScrollController();
  bool showNorthernFlights = true;
  bool isSearching = false;
  bool showNothingFound = false;

  @override
  void initState() {
    super.initState();
    displayedFlights = northernCircuitFlights;
  }

  void _filterFlights(String searchText) {
    final List<Flight> searchResults = [];

    if (searchText.isEmpty) {
      searchResults.addAll(showNorthernFlights
          ? northernCircuitFlights
          : southernCircuitFlights);
    } else {
      searchResults.addAll(showNorthernFlights
          ? northernCircuitFlights
          : southernCircuitFlights
              .where((flight) =>
                  flight.title.toLowerCase() == searchText.toLowerCase() ||
                  flight.location.toLowerCase() == searchText.toLowerCase())
              .toList());
    }

    setState(() {
      displayedFlights = searchResults;
      isSearching = searchText.isNotEmpty;
      showNothingFound = searchResults.isEmpty;
    });

    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToFlightDetails(Flight flight) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlightDetailsScreen(flight: flight),
      ),
    );
  }

  Widget _buildCarouselGrid(
    List<Flight> flights,
    String title,
    BuildContext context,
  ) {
    double cardHeight = MediaQuery.of(context).size.height * 0.7;

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
            height: cardHeight,
            enlargeCenterPage: true,
          ),
          items: flights.map((flight) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    _navigateToFlightDetails(flight);
                  },
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      height: cardHeight,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(8.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(flight.imageUrls.first),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              flight.title,
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
                                  flight.location,
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
                                  flight.phoneNumbers.join(", "),
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
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  void _showSearchBar() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 228, 182),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your Search..',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          if (searchText.isNotEmpty) {
                            _filterFlights(searchText);
                            Navigator.pop(context, true);
                          } else {
                            Navigator.pop(context, false);
                          }
                        },
                        child: Text('Search'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (result != null && result) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FlightsSearchResultsScreen(
            searchResults: displayedFlights,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          'Transportations',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 71, 62, 62),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Replace this with the logic to open the filter dialog
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showNorthernFlights = true;
                      displayedFlights = northernCircuitFlights;
                      showNothingFound = false;
                    });
                  },
                  child: Text('Northern Circuit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: showNorthernFlights
                        ? Colors.amberAccent
                        : Color.fromARGB(255, 238, 228, 182),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showNorthernFlights = false;
                      displayedFlights = southernCircuitFlights;
                      showNothingFound = false;
                    });
                  },
                  child: Text('Southern Circuit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !showNorthernFlights
                        ? Colors.amberAccent
                        : Color.fromARGB(255, 238, 228, 182),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            if (showNothingFound && !isSearching)
              NothingFoundPage()
            else
              _buildCarouselGrid(
                displayedFlights,
                showNorthernFlights ? 'Northern Circuit' : 'Southern Circuit',
                context,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showSearchBar();
        },
        label: Text('Search Title or Location'),
        icon: Icon(Icons.search),
        backgroundColor: Color.fromARGB(255, 238, 228, 182),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class NothingFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'No Flights Found',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
