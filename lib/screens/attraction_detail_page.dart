import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AttractionDetailPage extends StatelessWidget {
  final Map<String, dynamic> attraction;

  const AttractionDetailPage({Key? key, required this.attraction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LatLng attractionLocation =
        LatLng(-6.369028, 34.888822); // Example coordinates for Tanzania

    final String title = attraction['title'] ?? 'Unknown Title';
    final String location = attraction['location'] ?? 'Unknown Location';
    final String description =
        attraction['description'] ?? 'No description available.';
    final List<String> imageUrls =
        (attraction['image_urls'] as List<String>? ?? []);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: FlutterMap(
                options: MapOptions(
                  center: attractionLocation,
                  zoom: 13.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: attractionLocation,
                        width: 80.0,
                        height: 80.0,
                        child: GestureDetector(
                          onTap: () {
                            // Handle marker tap if needed
                          },
                          child: Icon(
                            Icons.location_on,
                            size: 40.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge, // Updated to displayLarge
                  ),
                  SizedBox(height: 8),
                  Text(
                    location,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium, // Updated to titleMedium
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium, // Updated to bodyMedium
                  ),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
              ),
              items: imageUrls.map<Widget>((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Text('Image not available'));
                        },
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
