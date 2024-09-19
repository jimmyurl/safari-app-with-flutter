import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SupabaseClient supabase = Supabase.instance.client;
  final _picker = ImagePicker();
  XFile? _image;
  String? _uploadDirectory;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLogin = true;

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
          SnackBar(
            content: Text('You must be logged in to upload an image'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final fileName = '${user.id}_${_image!.path.split('/').last}';
      final filePath = '$_uploadDirectory/$fileName';

      try {
        final file = File(_image!.path);
        await supabase.storage
            .from('images') // Your Supabase bucket name
            .upload(filePath, file);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image uploaded to $filePath'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload image: $e'),
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

  Future<void> _signUpOrLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      if (_isLogin) {
        final response = await supabase.auth.signInWithPassword(
          email: email,
          password: password,
        );

        if (response.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Successfully logged in'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        final response = await supabase.auth.signUp(
          email: email,
          password: password,
        );

        if (response.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Successfully signed up'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Sign up failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<List<String>> _fetchPopularDestinationsImages() async {
    final List<String> imageUrls = [];

    try {
      final List<FileObject> files = await supabase.storage
          .from('images')
          .list(path: 'Popular Destinations');

      for (var file in files) {
        final publicUrl = supabase.storage
            .from('images')
            .getPublicUrl('Popular Destinations/${file.name}');
        imageUrls.add(publicUrl);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching images: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSignUpOrLoginForm(),
            SizedBox(height: 20),
            _buildImageUploadSection(),
            SizedBox(height: 20),
            _buildPopularDestinationsCarousel(),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpOrLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _signUpOrLogin,
          child: Text(_isLogin ? 'Login' : 'Sign Up'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _isLogin = !_isLogin;
            });
          },
          child:
              Text(_isLogin ? 'Create an account' : 'Have an account? Login'),
        ),
      ],
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select an image to upload:'),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _selectImage,
          child: Text('Choose Image'),
        ),
        _image != null ? Image.file(File(_image!.path)) : Container(),
        SizedBox(height: 10),
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
      ],
    );
  }

  Widget _buildPopularDestinationsCarousel() {
    return FutureBuilder<List<String>>(
      future: _fetchPopularDestinationsImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No images found.');
        } else {
          final imageUrls = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Destinations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    final imageUrl = imageUrls[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.network(
                        imageUrl,
                        height: 150,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
