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
  String? _uploadUrl;

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
        await supabase.storage
            .from('images') // Replace with your actual bucket name
            .upload(filePath, File(_image!.path));

        // Get the public URL of the uploaded image
        final publicUrl =
            supabase.storage.from('images').getPublicUrl(filePath);

        setState(() {
          _uploadUrl = publicUrl; // Store the public URL
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image uploaded to $filePath'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        // Handle any errors during upload
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
            if (_uploadUrl != null)
              Text(
                'Uploaded Image URL: $_uploadUrl',
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
