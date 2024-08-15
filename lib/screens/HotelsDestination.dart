import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

/*
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotelsDestination extends StatefulWidget {
  final String selectedDestination;
  final String destination;
  final DateTime fromDate;
  final DateTime toDate;

  HotelsDestination({
    required this.destination,
    required this.fromDate,
    required this.toDate,
    required this.selectedDestination,
  });

  @override
  _HotelsDestinationState createState() => _HotelsDestinationState();
}

class _HotelsDestinationState extends State<HotelsDestination> {
  // Define a GoogleMapController to interact with the map
  late GoogleMapController _mapController;
  Set<Marker> _markers = {}; // Define the markers set
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF211955),
        title: Text('Hotels in ${widget.selectedDestination}'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _mapController = controller;
          // Implement logic to locate hotels on the map based on the search parameters
          _locateHotelsOnMap();
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0), // Set an initial position for the camera
          zoom: 12.0,
        ),
      ),
    );
  }

  // Implement the logic to locate hotels on the map based on the search parameters
  void _locateHotelsOnMap() {
    // Use widget.destination, widget.fromDate, and widget.toDate to locate hotels on the map
    // You can use APIs or databases to fetch hotel locations based on the search parameters
    // Once you have the hotel locations, update the map markers accordingly
    // For example:
    List<LatLng> hotelLocations = [
      LatLng(37.77483, -122.41942), // Example hotel location
      LatLng(37.77398, -122.42141), // Example hotel location
      // Add more hotel locations as needed
    ];

    // Create map markers for the hotel locations
    Set<Marker> markers = hotelLocations.map((latLng) {
      return Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
      );
    }).toSet();

    // Update the map markers
    setState(() {
      _markers = markers;
    });
  }
}
*/

class HotelsDestination extends StatefulWidget {
  //final Client client;
  final String selectedDestination;
  final String destination;
  final DateTime fromDate;
  final DateTime toDate;

  const HotelsDestination({
    Key? key,
    required this.selectedDestination,
    required this.destination,
    required this.fromDate,
    required this.toDate,
    // required this.client,
  }) : super(key: key);

  @override
  _HotelsDestinationState createState() => _HotelsDestinationState();
}

class _HotelsDestinationState extends State<HotelsDestination> {
  List<Hotel> hotels = [
    Hotel(
      name: 'Hotel A',
      price: 100,
      imageUrls: [
        'https://example.com/hotelA_image1.jpg',
        'https://example.com/hotelA_image2.jpg',
        'https://example.com/hotelA_image3.jpg',
      ],
    ),
    Hotel(
      name: 'Hotel B',
      price: 150,
      imageUrls: [
        'https://example.com/hotelB_image1.jpg',
        'https://example.com/hotelB_image2.jpg',
        'https://example.com/hotelB_image3.jpg',
      ],
    ),
    // Add more hotels as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF211955),
        title: Text('Hotels in ${widget.selectedDestination}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hotels[index].imageUrls.length,
                      itemBuilder: (context, imageIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.network(
                            hotels[index].imageUrls[imageIndex],
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    hotels[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '\$${hotels[index].price}/night',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // View hotel details or perform some action
                          },
                          child: const Text('View'),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Book hotel or perform some action
                          },
                          child: const Text('Book'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Hotel {
  final String name;
  final int price;
  final List<String> imageUrls;

  Hotel({
    required this.name,
    required this.price,
    required this.imageUrls,
  });

  get hotelDestination => null;
}
