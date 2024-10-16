import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_app/authentication/auth_screen.dart';
import 'package:user_app/global/global.dart';
import 'package:user_app/widgets/error_Dialog.dart';
import 'package:user_app/widgets/loading_dialog.dart';
import 'package:user_app/mainScreens/home_screen.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
// login
      loginNow();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog(
              message: "이메일 또는 비밀번호를 입력해주세요.",
            );
          });
    }
  }

  loginNow() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingDialog(
            message: '유효성 확인중',
          );
        });
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
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
      readDataAndSetDataLocally(currentUser!);
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        if (snapshot.data()!["status"] == "Approved") {
          await sharedPreferences!.setString("uid", currentUser.uid);
          await sharedPreferences!
              .setString("email", snapshot.data()!["email"]);
          await sharedPreferences!.setString("name", snapshot.data()!["name"]);
          await sharedPreferences!
              .setString("photo", snapshot.data()!["photo"]);

          List<String> userCartList =
              snapshot.data()!["userCart"].cast<String>();
          await sharedPreferences!.setStringList("userCart", userCartList);

          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          // ignore: use_build_context_synchronously
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          firebaseAuth.signOut();
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg:
                  "관리자가 계정을 제한했습니다. \n\n Mail to:admin@gmail.com");
        }
      } else {
        firebaseAuth.signOut();
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AuthScreen()));
        showDialog(
            context: context,
            builder: (context) {
              return const ErrorDialog(
                message: "계정이 없습니다. 계정을 생성해 주세요.",
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'assets/images/login.png',
                height: 270,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
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
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              formValidation();
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 119, 94, 102),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            child: const Text(
              "로그인",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
