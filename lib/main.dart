import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sante_app/features/signup/screen_doctor.dart';
import 'package:sante_app/features/signup/switching_screen.dart';
import 'package:sante_app/screens/appointment/appointment.dart';
import 'package:sante_app/screens/home.dart';
import 'package:sante_app/screens/home/widget/top_doctors.dart';

import 'core/image picker/image_picker.dart';
import 'features/login/screen.dart';
import 'features/signup/screen_patient.dart';
import 'screens/doctor/doctor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
            if(snapshot.hasData){
              return Home();
            }else{
              return  Login();
            }
           },

        ),
      ),
    );
  }
}
