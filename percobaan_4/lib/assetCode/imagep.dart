import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageProvider>(
      create: (context) => ImageProvider(),
      child: MaterialApp(
        home: const ImagePickerExample(),
      ),
    );
  }
}

class ImageProvider extends ChangeNotifier {
  File? _image;

  File? get image => _image;

  void setImage(File? image) {
    _image = image;
    notifyListeners();
  }
}

class ImagePickerExample extends StatelessWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageProvider.image != null
                ? Image.network(
                    imageProvider.image!.path,
                    height: 200,
                  )
                : Image.asset(
                    'asset/images/kubo1.jpg',
                    height: 200,
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImageFromGallery(context),
              child: const Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageProvider = Provider.of<ImageProvider>(context, listen: false);
      imageProvider.setImage(File(pickedImage.path));
    }
  }
}
