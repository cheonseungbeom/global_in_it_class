import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/widgets/custom_text_field.dart';
import 'package:user_app/widgets/error_Dialog.dart';
import 'package:user_app/widgets/loading_dialog.dart';
import 'package:user_app/mainScreens/home_screen.dart';
import '../global/global.dart';

//
//
//                  회원가입 클래스
//
//
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmePasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  String userImageUrl = "";

  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });

    print(imageXFile);
    print(imageXFile!.path);
  } //갤러리에서 사진 고르게 하기

  //폼 밸리데이션 함수
  Future<void> formValidation() async {
    if (imageXFile == null) {
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return const ErrorDialog(message: "이미지를 선택해 주세요!");
      //     });

      if (passwordController.text == confirmePasswordController.text) {
        if (confirmePasswordController.text.isNotEmpty &&
            nameController.text.isNotEmpty &&
            emailController.text.isNotEmpty) {
          showDialog(
              context: context,
              builder: (context) {
                return const LoadingDialog(
                  message: "계정 생성중...",
                );
              });

          authenticateUserAndSignUp(); //유저 인증 함수
        }
      }
    } else if (passwordController.text == confirmePasswordController.text) {
      if (confirmePasswordController.text.isNotEmpty &&
          nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty) {
//데이터 업로딩
        showDialog(
            context: context,
            builder: (context) {
              return const LoadingDialog(
                message: "계정 생성중...",
              );
            });

        try {
          // 파일 이름 생성 (현재 시간을 기반으로)
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();

          // Firebase Storage 참조 설정
          fStorage.Reference reference = fStorage.FirebaseStorage.instance
              .ref()
              .child('users')
              .child('$fileName.png');

          // 파일 업로드
          final fStorage.UploadTask uploadTask =
              reference.putFile(File(imageXFile!.path));

          //print(imageXFile!.path);

          // 업로드 완료 후 다운로드 URL 가져오기
          
            fStorage.TaskSnapshot taskSnapshot = await uploadTask;
            String downloadUrl = await taskSnapshot.ref.getDownloadURL();

            userImageUrl = downloadUrl;
          

          // 다운로드 URL을 변수에 저장

          // 유저 인증 및 회원가입 함수 호출
          authenticateUserAndSignUp();
          print("Uploading to path: users/$fileName.png");

          //print("Image uploaded successfully. URL: $downloadUrl");
        } catch (e) {
          print("Error occurred during image upload: $e");
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const ErrorDialog(message: "빈 항목이 없이 입력해주세요.");
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog(message: "패스워드가 맞지 않습니다.");
          });
    }
  } //폼 벨리데이션에서 파이어베이스 스토리지에 저장

  void authenticateUserAndSignUp() async {
    User? currentUser; //유저 타입의 변수

    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    ) // 계정생성 메소드
        .then((auth) {
      currentUser = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentUser != null) {
      saveDataToFireStore(currentUser!).then((value) {
        Navigator.pop(context);
        Route newRoute =
            MaterialPageRoute(builder: (context) => const HomeScreen());
        Navigator.pushReplacement(context, newRoute);
      });
    }
  } //authenticateUserAndSignUp() 함수 정의

  Future saveDataToFireStore(User currentUser) async {
    FirebaseFirestore.instance.collection('users').doc(currentUser.uid).set({
      "uid": currentUser.uid,
      "email": currentUser.email,
      "name": nameController.text.trim(),
      "photo": userImageUrl,
      "status": "Approved",
      "userCart": ['garbageValue'],
    }); //파이어베이스 파이어스토어 업로드

    //로컬로 데이터 저장
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email.toString());
    await sharedPreferences!.setString("name", nameController.text.trim());
    await sharedPreferences!.setString("photo", userImageUrl);

    await sharedPreferences!.setStringList("userCart", ['garbageValue']);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _getImage();
              },
              child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.20,
                  backgroundColor: Colors.white,
                  backgroundImage: imageXFile == null
                      ? null
                      : FileImage(
                          File(imageXFile!.path),
                        ),
                  child: imageXFile == null
                      ? Icon(
                          Icons.add_photo_alternate,
                          size: MediaQuery.of(context).size.width * 0.20,
                          color: Colors.grey,
                        )
                      : null),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    data: Icons.person,
                    controller: nameController,
                    hintText: '이름',
                    isObsecre: false,
                  ),
                  CustomTextField(
                    data: Icons.email,
                    controller: emailController,
                    hintText: 'E-mail',
                    isObsecre: false,
                  ),
                  CustomTextField(
                    data: Icons.lock,
                    controller: passwordController,
                    hintText: '비밀번호',
                    isObsecre: true,
                  ),
                  CustomTextField(
                    data: Icons.lock,
                    controller: confirmePasswordController,
                    hintText: '비밀번호 확인',
                    isObsecre: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //가입버튼
            ElevatedButton(
              onPressed: () => {
                formValidation(),
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              child: const Text(
                "가 입",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
