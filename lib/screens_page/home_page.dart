import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup_with_email_and_other_method/screens_page/signIn_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()))
              });
        },
        child: const Text('Login'),
      )),
    );
  }
}
