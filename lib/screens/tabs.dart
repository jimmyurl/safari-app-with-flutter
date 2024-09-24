import 'package:flutter/material.dart';
import 'tabs_item.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key, required this.onTabSelected});

  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: SizedBox(
        height: 46,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  TabItem(
                    text: 'Zoo',
                    imageUrl: 'assets/icons/zoo.png',
                    onTap: () => onTabSelected(0),
                  ),
                  const SizedBox(width: 30),
                  TabItem(
                    text: 'Mountain',
                    imageUrl: 'assets/icons/mountain.png',
                    onTap: () => onTabSelected(1),
                  ),
                  const SizedBox(width: 30),
                  TabItem(
                    text: 'Waterfall',
                    imageUrl: 'assets/icons/waterfall.png',
                    onTap: () => onTabSelected(2),
                  ),
                  const SizedBox(width: 30),
                  TabItem(
                    text: 'Parks',
                    imageUrl: 'assets/icons/parks.png',
                    onTap: () => onTabSelected(3),
                  ),
                  const SizedBox(width: 30),
                  TabItem(
                    text: 'Reserves',
                    imageUrl: 'assets/icons/reserves.png',
                    onTap: () => onTabSelected(4),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              left: 0,
              child: Container(color: Colors.black, height: 3, width: 55),
            ),
          ],
        ),
      ),
    );
  }
}
