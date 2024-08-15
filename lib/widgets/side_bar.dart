import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.height,
    required this.width,
    required this.navigator,
    this.onHomePressed,
  }) : super(key: key);

  final double height;
  final double width;
  final GlobalKey<NavigatorState> navigator;
  final VoidCallback? onHomePressed;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<Map> menu = [
    {'title': 'Home', 'routeName': '/homepage'},
    {'title': 'Activities', 'routeName': '/activities'},
    {'title': 'Stays', 'routeName': '/hotels'},
    {'title': 'Flights', 'routeName': '/flights'},
    {'title': 'Restaurants', 'routeName': '/restaurants'}
  ];

  int sideBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.2,
      color: const Color(0xFF211955),
      child: Column(
        children: [
          SizedBox(
            height: widget.height * 0.05,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: menu.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RotatedBox(
                quarterTurns: 3,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      sideBarIndex = index;
                    });

                    if (index == 0 && widget.onHomePressed != null) {
                      widget
                          .onHomePressed!(); // Call the onHomePressed callback if provided
                    } else {
                      widget.navigator.currentState!.pushNamed(
                        menu[index]['routeName'],
                      );
                    }
                  },
                  style: TextButton.styleFrom(minimumSize: const Size(100, 50)),
                  child: Text(
                    menu[index]['title'],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: (index == sideBarIndex)
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: (index == sideBarIndex)
                              ? Colors.white
                              : Colors.white.withAlpha(200),
                          letterSpacing: 2,
                        ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
