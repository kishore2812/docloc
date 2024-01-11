// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'SignIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyCS7wCbfwFLIH_3aqeOhS3x2hDWRMnrtkI",
              appId: "1:414247646460:android:fae5b437f1842589c71379",
              messagingSenderId: "414247646460",
              projectId: "doc-loc-b1160"))
      : await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DOCLOC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: determineInitialRoute(),
      routes: {
        '/signin': (context) => SignInDemo(),
        '/home': (context) => HomePage(user: null),
        '/settings': (context) => HomePage(user: null),
        '/camera': (context) => HomePage(user: null),
        '/help': (context) => HomePage(user: null),
      },
    );
  }

  String determineInitialRoute() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null ? '/home' : '/signin';
  }
}
