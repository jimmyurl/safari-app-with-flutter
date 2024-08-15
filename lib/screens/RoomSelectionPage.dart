import 'package:flutter/material.dart';

class RoomSelectionPage extends StatefulWidget {
  final int numberOfRooms;
  final int numberOfAdults;
  final int numberOfChildren;

  const RoomSelectionPage({Key? key, 
    required this.numberOfRooms,
    required this.numberOfAdults,
    required this.numberOfChildren,
  }) : super(key: key);

  @override
  _RoomSelectionPageState createState() => _RoomSelectionPageState();
}

class _RoomSelectionPageState extends State<RoomSelectionPage> {
  late int numberOfRooms;
  late int numberOfAdults;
  late int numberOfChildren;

  @override
  void initState() {
    super.initState();
    numberOfRooms = widget.numberOfRooms;
    numberOfAdults = widget.numberOfAdults;
    numberOfChildren = widget.numberOfChildren;
  }

  void updateNumberOfRooms(int value) {
    setState(() {
      numberOfRooms = value;
    });
  }

  void updateNumberOfAdults(int value) {
    setState(() {
      numberOfAdults = value;
    });
  }

  void updateNumberOfChildren(int value) {
    setState(() {
      numberOfChildren = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF211955),
        title: const Text('Room Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Number of Rooms',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (numberOfRooms > 1) {
                      updateNumberOfRooms(numberOfRooms - 1);
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(numberOfRooms.toString()),
                IconButton(
                  onPressed: () {
                    updateNumberOfRooms(numberOfRooms + 1);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Number of Adults',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (numberOfAdults > 1) {
                      updateNumberOfAdults(numberOfAdults - 1);
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(numberOfAdults.toString()),
                IconButton(
                  onPressed: () {
                    updateNumberOfAdults(numberOfAdults + 1);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Number of Children',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (numberOfChildren > 0) {
                      updateNumberOfChildren(numberOfChildren - 1);
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(numberOfChildren.toString()),
                IconButton(
                  onPressed: () {
                    updateNumberOfChildren(numberOfChildren + 1);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final selectedValues = {
                  'numberOfRooms': numberOfRooms,
                  'numberOfAdults': numberOfAdults,
                  'numberOfChildren': numberOfChildren,
                };
                Navigator.pop(context,
                    selectedValues); // Pass selected values back to DestinationCard
              },
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
