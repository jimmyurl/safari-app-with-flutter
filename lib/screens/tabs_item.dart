import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.onTap,
  });

  final String text;
  final String imageUrl;
  final VoidCallback onTap; // Callback for when the tab is tapped

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap function when tapped
      child: Column(
        children: <Widget>[
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
