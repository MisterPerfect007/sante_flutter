import 'package:flutter/material.dart';
import 'package:sante_app/pub.dev/caroussel.dart';
import 'package:sante_app/pub.dev/splash_screen.dart';
import 'package:sante_app/screens/home.dart';
import 'package:sante_app/screens/search/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Comforter',
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
