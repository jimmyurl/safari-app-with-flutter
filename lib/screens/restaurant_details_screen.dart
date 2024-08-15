import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tanzaniasafari/models/restaurant_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  restaurant.imageUrls.first,
                  fit: BoxFit.cover,
                  height: 250.0, // Adjust the height as per your preference
                  width: double.infinity,
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Text(
                    restaurant.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    restaurant.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      _buildActionButton(
                        text: 'Call Now',
                        onPressed: () => _callNow(context),
                      ),
                      const SizedBox(width: 8.0),
                      _buildActionButton(
                        text: 'Show Direction',
                        onPressed: () => _showDirection(context),
                      ),
                      const SizedBox(width: 8.0),
                      _buildActionButton(
                        text: 'Book Now',
                        onPressed: () => _bookNow(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'More Pictures:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _buildMorePicturesGridView(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  void _callNow(BuildContext context) async {
    final url = 'tel:${restaurant.phoneNumbers}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _bookNow(BuildContext context) {
    // Implement booking functionality
  }

  void _showDirection(BuildContext context) {
    final latitude = restaurant.latitude;
    final longitude = restaurant.longitude;
    final url = 'https://maps.google.com/?q=$latitude,$longitude';
    launch(url);
  }

  Widget _buildMorePicturesGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: restaurant.morePicturesUrls.length,
      itemBuilder: (context, index) {
        final imageUrl = restaurant.morePicturesUrls[index];
        return GestureDetector(
          onTap: () => _showImageDialog(context, imageUrl),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            color: Colors.black,
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          ),
        );
      },
    );
  }
}
