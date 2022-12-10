import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_practice/screen/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  Credential? credential = Credentials.applicationDefault();

  // when no credentials found, login using openid
  // the credentials are stored on disk for later use
  credential ??= await Credentials.login();
  var app = FirebaseAdmin.instance.initializeApp(AppOptions(
      credential: credential,
      projectId: 'fir-admin-7b860'));
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
      home: const HomePage()
    );
  }
}
