import 'package:flutter/material.dart';
import 'package:tanzaniasafari/models/activity_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF211955),
        title: Text(activity.title),
      ),
      body: Stack(
        children: [
          _ActivityImage(activity: activity),
          _ActivityDetailsOverlay(activity: activity),
        ],
      ),
    );
  }
}

class _ActivityImage extends StatelessWidget {
  const _ActivityImage({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: MediaQuery.of(context).size.aspectRatio,
            viewportFraction: 1.0,
          ),
          items: activity.imageUrls.map((imageUrl) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ActivityDetailsOverlay extends StatelessWidget {
  const _ActivityDetailsOverlay({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.black.withOpacity(0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.description,
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
                  '\$${activity.price}',
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
      ),
    );
  }
}
