import 'package:flutter/material.dart';
import 'package:tanzaniasafari/models/flight_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class FlightDetailsScreen extends StatelessWidget {
  final Flight flight;

  const FlightDetailsScreen({Key? key, required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9, // Set the desired aspect ratio
                  child: Image.network(
                    flight.imageUrls.first,
                    fit: BoxFit.cover,
                  ),
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
                    flight.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    flight.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      _buildActionButton(
                        text: 'Call Now',
                        onPressed: _callNow,
                      ),
                      const SizedBox(width: 8.0),
                      _buildActionButton(
                        text: 'Book Now',
                        onPressed: _bookNow,
                      ),
                      const SizedBox(width: 8.0),
                      _buildActionButton(
                        text: 'Show Direction',
                        onPressed: _showDirection,
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
                  const SizedBox(height: 16.0),
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

  void _callNow() async {
    final url = 'tel:${flight.phoneNumbers.first}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _bookNow() {
    // Implement booking functionality
  }

  void _showDirection() {
    final latitude = flight.latitude;
    final longitude = flight.longitude;
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
      itemCount: flight.morePicturesUrls.length,
      itemBuilder: (context, index) {
        final imageUrl = flight.morePicturesUrls[index];
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
