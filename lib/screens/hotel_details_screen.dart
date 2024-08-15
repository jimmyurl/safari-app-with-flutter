import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tanzaniasafari/models/hotel_model.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF211955),
        title: Text(hotel.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HotelImage(hotel: hotel),
          _HotelDetailsOverlay(hotel: hotel),
        ],
      ),
    );
  }
}

class _HotelImage extends StatelessWidget {
  const _HotelImage({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0, // Adjust the height as per your preference
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
        ),
        items: hotel.morePicturesUrls.map((imageUrl) {
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
          );
        }).toList(),
      ),
    );
  }
}

class _HotelDetailsOverlay extends StatelessWidget {
  const _HotelDetailsOverlay({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotel.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${hotel.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
