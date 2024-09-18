import 'package:flutter/material.dart';
import 'package:tanzaniasafari/models/hotel_model.dart'; // Import the hotel model

class HotelDetailsScreen extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailsScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display hotel image carousel or image
            Image.network(
              hotel.imageUrls.isNotEmpty
                  ? hotel.imageUrls[0]
                  : 'https://example.com/placeholder.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            // Hotel details section
            Text(
              hotel.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Location: ${hotel.location}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Rating: ${hotel.rating} stars',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            // Display hotel description and amenities
            Text(
              hotel.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Amenities: ${hotel.amenities.join(", ")}',
              style: const TextStyle(fontSize: 16),
            ),
            // Add more hotel details as needed
          ],
        ),
      ),
    );
  }
}
