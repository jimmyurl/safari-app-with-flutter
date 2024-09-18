import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class ImageUploadService {
  final _supabaseClient = Supabase.instance.client;

  Future<void> uploadImage(File image, String tableName) async {
    try {
      // Create a unique file path for the image
      final filePath =
          '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';

      // Upload the image to the 'images' bucket in Supabase Storage
      final uploadResponse =
          await _supabaseClient.storage.from('images').upload(filePath, image);

      // If the upload fails, Supabase will throw an exception, handle it here
      if (uploadResponse.isEmpty) {
        throw Exception('Failed to upload image.');
      }

      // Retrieve the public URL of the uploaded image
      final imageUrl =
          _supabaseClient.storage.from('images').getPublicUrl(filePath);

      // Save the image URL to the specified table in Supabase
      final insertResponse = await _supabaseClient.from(tableName).insert({
        'image_url': imageUrl,
        // Add other fields as needed
      }).select(); // This will ensure the operation returns data.

      // If insertResponse is empty, it indicates a problem with the insertion.
      if (insertResponse.isEmpty) {
        throw Exception('Failed to insert image URL into the database.');
      }
    } catch (error) {
      throw Exception('Error in uploadImage: $error');
    }
  }
}
