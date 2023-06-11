import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageUploaderProvider(),
      child: MaterialApp(
        title: 'Image Uploader',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ImageUploader(),
      ),
    );
  }
}

class ImageUploaderProvider extends ChangeNotifier {
  String? _selectedImagePath;
  
  String? get selectedImagePath => _selectedImagePath;

  void selectImage(String imagePath) {
    _selectedImagePath = imagePath;
    notifyListeners();
  }
}

class ImageUploader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImageUploaderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (provider.selectedImagePath != null)
              Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.network(
                      provider.selectedImagePath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(provider.selectedImagePath!),
                ],
              ),
            ElevatedButton(
              onPressed: () => _pickImage(context),
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }

  void _pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      Provider.of<ImageUploaderProvider>(context, listen: false)
          .selectImage(image.path);
    }
  }
}
