import 'package:flutter/material.dart';
import 'package:animal_feed/HomePage.dart';

import 'package:firebase_core/firebase_core.dart';

import 'CompletDinner.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void onPressed(){}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     home: HomePage(),
    );
  }
}

