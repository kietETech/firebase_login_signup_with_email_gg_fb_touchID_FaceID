import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_signup_with_email_and_other_method/screens_page/signIn_page.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyCuGksZFMkWRacwjSv6n1inrAI-biVHG08',
            appId: '1:1083536751798:android:e21c1eaa89ef8327dffa17',
            messagingSenderId: '1083536751798',
            projectId: 'testapp1-1117a'));
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
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
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}
