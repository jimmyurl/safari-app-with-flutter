import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService {
  final String appWriteEndPoint = 'http://192.168.43.38/v1';
  final String projectId = '64ba43d6b51481dd6669';
  final String attractionsCollectionId =
      '64ba52f7226b4f2d738b'; // Update with your collection ID

  late Client _client;
  late Account _account;
  late Databases _database; // Change this to Database

  AppwriteService() {
    _client = Client()
        .setEndpoint(appWriteEndPoint)
        .setProject(projectId)
        .setSelfSigned(status: true);
    _account = Account(_client);
    _database = Databases(_client); // Change this to Database
  }

  Future<List<Attraction>> getAttractions() async {
    try {
      final DocumentList response = await _database.listDocuments(
        databaseId:
            '64ba52e62120a687aca2', // You should provide your database ID here
        collectionId: attractionsCollectionId,
      );

      final List<Attraction> attractions = [];

      if (response.documents != null && response.documents is List) {
        final List<dynamic> data = response.documents!;
        for (var item in data) {
          final Attraction attraction = Attraction(
            imageUrl: item['imageUrl'],
            title: item['title'],
            location: item['location'],
          );
          attractions.add(attraction);
        }
      }

      return attractions;
    } catch (e) {
      throw e.toString();
    }
  }
}

class Attraction {
  final String imageUrl;
  final String title;
  final String location;

  Attraction({
    required this.imageUrl,
    required this.title,
    required this.location,
  });
}
