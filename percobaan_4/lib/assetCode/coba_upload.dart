import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ImageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ImageProvider>(
                builder: (context, imageProvider, child) {
                  return imageProvider.namaImage != ""
                      ? Image.network(
                          //chrome
                          'http://127.0.0.1:8000/getimage/${imageProvider.namaImage}',

                          //android
                          //'http://10.0.2.2:8000/getimage/${imageProvider.namaImage}',
                          height: 200,
                        )
                      : const Text(" Image Tidak Tersedia");
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    context.read<ImageProvider>().getImageFromGallery(),
                child: const Text('Select Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageProvider with ChangeNotifier {
  String namaImage = "";

  final dio = Dio();

  Future<String> uploadFile(List<int> file, String fileName) async {
    print("mulai");
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(file,
          filename: fileName, contentType: MediaType("image", "png")),
    });
    var response =
        //untuk chorme
        await dio.post("http://127.0.0.1:8000/uploadimage", data: formData);

    //untuk android
    //await dio.post("http://10.0.2.2:8000/uploadimage", data: formData);

    print(response.statusCode);
    if (response.statusCode == 200) {
      namaImage = fileName;
      notifyListeners();
    }
    return fileName;
  }

  Future<void> getImageFromGallery() async {
    print("get image");
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final bytes = await pickedImage?.readAsBytes();
    if (pickedImage != null) {
      print("mulai upload");
      await uploadFile(bytes as List<int>, pickedImage.name);
    }
  }
}
