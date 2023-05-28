import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Uploader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageUploader(),
    );
  }
}

class ImageUploader extends StatefulWidget {
  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  String? _selectedImagePath;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedImagePath != null)
              Container(
                width: 200,
                height: 200,
                child: Image.network(
                  _selectedImagePath!,
                  fit: BoxFit.cover,
                ),
              ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}
