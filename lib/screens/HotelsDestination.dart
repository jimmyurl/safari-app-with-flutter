import 'package:flutter/material.dart';
import 'package:tanzaniasafari/models/hotel_model.dart'; // Import the Hotel model
import 'package:supabase_flutter/supabase_flutter.dart';

class HotelsDestination extends StatefulWidget {
  final String destination;

  const HotelsDestination({Key? key, required this.destination})
      : super(key: key);

  @override
  _HotelsDestinationState createState() => _HotelsDestinationState();
}

class _HotelsDestinationState extends State<HotelsDestination> {
  List<Hotel> hotels = [];
  List<String> attractions = []; // List to hold attractions
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchHotelsAndAttractions();
  }

  Future<void> _fetchHotelsAndAttractions() async {
    final client = Supabase.instance.client;

    try {
      // Fetch hotels based on the destination
      final hotelResponse = await client
          .from('hotels')
          .select()
          .or('location.eq.${widget.destination},title.eq.${widget.destination}')
          .then((response) => response); // Get the response directly

      if (hotelResponse.isNotEmpty) {
        final List<Map<String, dynamic>> hotelData =
            List<Map<String, dynamic>>.from(hotelResponse);
        hotels = hotelData
            .map((json) => Hotel(
                  id: json['id'],
                  title: json['title'],
                  description: json['description'],
                  imageUrls: List<String>.from(json['imageUrls']),
                  rating: (json['rating'] as num).toDouble(),
                  location: json['location'],
                  zone: json['zone'],
                  hotelClass: json['hotelClass'],
                  amenities: List<String>.from(json['amenities']),
                  phoneNumbers: List<String>.from(json['phoneNumbers']),
                  latitude: (json['latitude'] as num).toDouble(),
                  longitude: (json['longitude'] as num).toDouble(),
                ))
            .toList();
      }

      // Fetch attractions from multiple tables: adventures, sightseeing, and cultural experiences
      final adventureResponse = await client
          .from('adventures')
          .select()
          .or('location.eq.${widget.destination},title.eq.${widget.destination}')
          .then((response) => response); // Get the response directly

      final sightseeingResponse = await client
          .from('sightseeing')
          .select()
          .or('location.eq.${widget.destination},title.eq.${widget.destination}')
          .then((response) => response);

      final culturalExperienceResponse = await client
          .from('cultural_experiences')
          .select()
          .or('location.eq.${widget.destination},title.eq.${widget.destination}')
          .then((response) => response);

      // Combine attractions from all tables
      if (adventureResponse.isNotEmpty) {
        attractions.addAll(
            List<String>.from(adventureResponse.map((item) => item['title'])));
      }

      if (sightseeingResponse.isNotEmpty) {
        attractions.addAll(List<String>.from(
            sightseeingResponse.map((item) => item['title'])));
      }

      if (culturalExperienceResponse.isNotEmpty) {
        attractions.addAll(List<String>.from(
            culturalExperienceResponse.map((item) => item['title'])));
      }

      setState(() {
        isLoading = false; // Update loading state
      });
    } catch (err) {
      // Handle any errors that occur during the fetch
      setState(() {
        isLoading = false; // Update loading state
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching data: $err'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for ${widget.destination}'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Display hotels
                  if (hotels.isNotEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Hotels',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: hotels.length,
                      itemBuilder: (context, index) {
                        final hotel = hotels[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: ListTile(
                            title: Text(hotel.title),
                            subtitle: Text(hotel.description),
                            leading: Image.network(hotel.imageUrls.isNotEmpty
                                ? hotel.imageUrls[0]
                                : ''),
                          ),
                        );
                      },
                    ),
                  ],

                  // Display attractions
                  if (attractions.isNotEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Attractions',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: attractions.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: ListTile(
                            title: Text(attractions[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
    );
  }
}
