import 'package:flutter/material.dart';
import 'package:tanzaniasafari/screens/flight_details_screen.dart';
import 'package:tanzaniasafari/models/flight_model.dart';

class FlightsSearchResultsScreen extends StatelessWidget {
  static const routeName = '/searchResults';

  final List<Flight> searchResults;

  FlightsSearchResultsScreen({required this.searchResults});

  void _navigateToFlightDetails(BuildContext context, Flight flight) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlightDetailsScreen(flight: flight),
      ),
    );
  }

  Widget _buildFlightCard(BuildContext context, Flight flight) {
    return GestureDetector(
      onTap: () {
        _navigateToFlightDetails(context, flight);
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              flight.imageUrls.first,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flight.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    flight.location,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Search Results'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: searchResults
              .map((flight) => _buildFlightCard(context, flight))
              .toList(),
        ),
      ),
    );
  }
}
