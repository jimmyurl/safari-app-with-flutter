import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tanzaniasafari/models/adventure_model.dart';

class MorePicturesScreen extends StatelessWidget {
  final Adventure adventure;

  const MorePicturesScreen({Key? key, 
    required this.adventure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> morePictures = adventure.morePicturesUrls;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EDDC),
        title: Text(adventure.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCarouselGrid(morePictures, context),
            // Display additional details or actions if needed
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselGrid(List<String> morePictures, BuildContext context) {
    if (morePictures.isEmpty) {
      return const SizedBox.shrink();
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
      ),
      items: morePictures.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

Widget _buildCarouselGrid(List<String> morePictures, BuildContext context) {
  if (morePictures.isEmpty) {
    return const SizedBox.shrink();
  }

  return CarouselSlider(
    options: CarouselOptions(
      height: 250,
      enlargeCenterPage: true,
    ),
    items: morePictures.map((imageUrl) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }).toList(),
  );
}
