import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//유저 이미지를 선택하기위한 파일

class AddImage extends StatefulWidget {
  const AddImage(this.addImageFunc, {super.key});

  final Function(File pickedImage)
      addImageFunc; //유저의 이미지를 전달해 주어야 하므로 아규먼트로 파일타입의 pickedImage 전달

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? pickedImage;

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50, maxHeight: 150);
    setState(() {
      if (pickedImageFile != null) pickedImage = File(pickedImageFile.path);
    });
    widget.addImageFunc(pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: 150,
      height: 300,
      child: Column(
        children: [
          CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
              backgroundImage:
                  pickedImage != null ? FileImage(pickedImage!) : null),
          const SizedBox(
            height: 10.0,
          ),
          OutlinedButton.icon(
            onPressed: () {
              _pickImage();
            },
            label: const Text('Add icon'),
            icon: const Icon(Icons.image),
          ),
          const SizedBox(
            height: 80,
          ),
          TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              label: const Text('Close'))
        ],
      ),
    );
  }
}
