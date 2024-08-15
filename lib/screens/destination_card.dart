/*import 'package:flutter/material.dart';
import 'package:tanzaniasafari/screens/HotelsDestination.dart';

class DestinationCard extends StatelessWidget {
  final String selectedDestination;
  final DateTime fromDate;
  final DateTime toDate;

  DestinationCard(
      {required this.fromDate,
      required this.toDate,
      required this.selectedDestination});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Destination',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              selectedDestination,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelsDestination(
                      destination: selectedDestination,
                      fromDate: fromDate,
                      toDate: toDate,
                      selectedDestination: selectedDestination,
                    ),
                  ),
                );
              },
              child: const Text('Search Hotels'),
            ),
          ],
        ),
      ),
    );
  }
}
*/