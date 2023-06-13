import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Layouts/responsive_layout.dart';
import 'package:instagram_clone/screens/LoginScreen.dart';
import 'package:instagram_clone/screens/SignupScreen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCe6fcV3-D-K3BBpLpx9i2ZvYNLP3ZhkTc",
          appId: "1:86294315236:web:d16c73fb9961a8bc8a6cf1",
          messagingSenderId: "86294315236",
          projectId: "instagramclone-eaf78",
          storageBucket: "instagramclone-eaf78.appspot.com"),
    );
  }

  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
    androidProvider: AndroidProvider.debug,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: SignupScreen(),
    );
  }
}
