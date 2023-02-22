import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup_with_email_and_other_method/screens_page/home_page.dart';
import 'package:flutter/material.dart';

import '../reusable_widget/reusable_widget.dart';
import '../uitlls/collor_utills.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.center, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              ImageWidget('img/google.png'),
              const SizedBox(
                height: 30,
              ),
              ReusableTextFormField(
                  "Enter user name", Icons.person, false, _emailController),
              const SizedBox(
                height: 30,
              ),
              ReusableTextFormField("Enter password", Icons.lock_open_outlined,
                  true, _passWordController),
              const SizedBox(
                height: 30,
              ),
              CustomButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passWordController.text,
                    )
                    .then((value) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()))
                        });
              }),
              const SizedBox(
                height: 10,
              ),
              signUpOption(context)
            ]),
          ),
        ),
      ),
    );
  }
}

Widget ImageWidget(String imagePath) {
  return Image.asset(
    imagePath,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}
