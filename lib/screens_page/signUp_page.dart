import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup_with_email_and_other_method/reusable_widget/reusable_widget.dart';
import 'package:firebase_login_signup_with_email_and_other_method/screens_page/home_page.dart';
import 'package:firebase_login_signup_with_email_and_other_method/uitlls/collor_utills.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userlController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.8),
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ReusableTextFormField('Enter user name', Icons.person_outline,
                    false, _userlController),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextFormField('Enter email name', Icons.person_outline,
                    false, _emailController),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextFormField('Enter password name', Icons.lock_outline,
                    false, _passWordController),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passWordController.text)
                      .then((value) => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()))
                          })
                      .onError((error, stackTrace) => {});
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
