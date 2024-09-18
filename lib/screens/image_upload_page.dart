import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  final SupabaseClient supabase = Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _uploadDirectory;
  UploadResponse? _uploadResponse;

  Future<void> _selectImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  Future<void> _uploadImage() async {
    if (_image != null && _uploadDirectory != null) {
      final user = supabase.auth.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You must be logged in to upload an image'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final fileName = '${user.id}_${_image!.path.split('/').last}';
      final filePath = '$_uploadDirectory/$fileName';

      try {
        // Upload the image to Supabase storage
        final storageResponse = await supabase.storage
            .from('your-bucket-name') // Replace with your actual bucket name
            .upload(filePath, File(_image!.path));

        // Debugging: Print the storageResponse to check its structure
        print('Storage Response: $storageResponse');

        // Check if storageResponse.error is not null
        if (storageResponse.error == null) {
          setState(() {
            _uploadResponse = UploadResponse(
              url: supabase.storage
                  .from('your-bucket-name')
                  .getPublicUrl(filePath)
                  .data!,
              errorMessage: '',
            );
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Image uploaded to $filePath'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Handle the error correctly
          setState(() {
            _uploadResponse = UploadResponse(
              url: '',
              errorMessage: storageResponse.error!
                  .message, // Ensure storageResponse.error is accessed correctly
            );
          });
        }
      } catch (e) {
        // Handle any other errors
        setState(() {
          _uploadResponse = UploadResponse(
            url: '',
            errorMessage: 'Error occurred: $e',
          );
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error occurred: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an image and directory.'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _selectImage,
              child: Text('Select Image'),
            ),
            _image != null
                ? Image.file(File(_image!.path), height: 200, width: 200)
                : Container(),
            SizedBox(height: 20),
            DropdownButton<String>(
              hint: Text('Select Upload Directory'),
              value: _uploadDirectory,
              items: [
                DropdownMenuItem(
                  child: Text('Popular Destinations'),
                  value: 'popular_destinations',
                ),
                // Add more directories as needed
              ],
              onChanged: (value) {
                setState(() {
                  _uploadDirectory = value;
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
            SizedBox(height: 20),
            _uploadResponse != null
                ? Text(
                    _uploadResponse!.getErrorMessage.isEmpty
                        ? 'Uploaded Image URL: ${_uploadResponse!.getUrl}'
                        : 'Error: ${_uploadResponse!.getErrorMessage}',
                    style: TextStyle(
                        color: _uploadResponse!.getErrorMessage.isEmpty
                            ? Colors.green
                            : Colors.red),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

// Encapsulated class for handling upload response
class UploadResponse {
  final String url;
  final String errorMessage;

  UploadResponse({
    required this.url,
    required this.errorMessage,
  });

  // Getters for the class
  String get getUrl => url;
  String get getErrorMessage => errorMessage;
}
