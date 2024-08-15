import 'package:flutter/material.dart';
import 'package:tanzaniasafari/models/adventure_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:photo_view/photo_view.dart';

class AdventureDetailsScreen extends StatelessWidget {
  final Adventure adventure;

  const AdventureDetailsScreen({Key? key, required this.adventure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                adventure.imageUrls.first,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Text(
                    adventure.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _buildExpandableDescription(adventure.description),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      _buildActionButton(
                        text: 'Call Now',
                        onPressed: _callNow,
                      ),
                      const SizedBox(width: 8.0),
                      _buildActionButton(
                        text: 'Show Direction',
                        onPressed: _showDirection,
                      ),
                      const SizedBox(width: 8.0),
                      _buildActionButton(
                        text: 'Book Now',
                        onPressed: _bookNow,
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
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableDescription(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        ExpandableText(
          text: description,
          maxLines: 3,
        ),
      ],
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
    final url = 'tel:${adventure.phoneNumbers.first}';
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
    final latitude = adventure.latitude;
    final longitude = adventure.longitude;
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
      itemCount: adventure.morePicturesUrls.length,
      itemBuilder: (context, index) {
        final imageUrl = adventure.morePicturesUrls[index];
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

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableText({Key? key, 
    required this.text,
    required this.maxLines,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(text: widget.text);
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);

        if (textPainter.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: widget.text,
                  style: textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: _isExpanded ? ' Less' : ' More',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _toggleExpanded,
                    ),
                  ],
                ),
                maxLines: _isExpanded ? null : widget.maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        } else {
          return Text(widget.text);
        }
      },
    );
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
