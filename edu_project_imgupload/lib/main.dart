import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? uploadedFileURL;
  bool isLoading = false;
  File? pickedImage;
  var random = Random();
  String imageName = _generateRandomName();

  // void pickedImage(File image) {
  //   userPickedImage = image;
  // }

  Future uploadFile() async {
    setState(() {
      isLoading = true;
    });
    final refImage =
        FirebaseStorage.instance.ref().child('images').child('$imageName.png');

    await refImage.putFile(pickedImage!);
    final uploadedFileURL = await refImage.getDownloadURL();
    // print(uploadedFileURL);
    print(imageName);
  }

  // void showAlert(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //             backgroundColor: Colors.white, child: AddImage(pickedImage));
  //       });
  // }

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxHeight: 150);
    setState(() {
      if (pickedImageFile != null) {
        pickedImage = File(pickedImageFile.path);
      }
    });
    //widget.addImageFunc(pickedImage);

    uploadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore File Upload'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickImage();
        },
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

String _generateRandomName() {
  var random = Random();
  return random.nextInt(100000).toString(); // 난수를 문자열로 변환하여 반환
}
