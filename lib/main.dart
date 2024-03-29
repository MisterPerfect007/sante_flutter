import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/features/login/utils.dart';
import 'package:sante_app/features/signup/screen_doctor.dart';
import 'package:sante_app/features/signup/switching_screen.dart';
import 'package:sante_app/screens/appointment/appointment.dart';
import 'package:sante_app/screens/home.dart';
import 'package:sante_app/screens/home/widget/top_doctors.dart';
import 'package:sante_app/services/auth/auth.dart';

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
    final auth = Auth(FirebaseAuth.instance);
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: auth.authStateChanges,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final User? user = snapshot.data;
              if (user != null) {
                return FutureBuilder<bool>(
                    future: isDoctor(user.uid),
                    builder: (context, snapshot) {
                      bool? isUserADoctor = snapshot.data;
                      if (isUserADoctor != null) {
                        return isUserADoctor
                            ? DoctorSpace(user: user)
                            : Home(user: user,);
                      }
                      return Container(
                        color: Colors.white,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    });
                // setPageToShow() async {
                //   return await isDoctor(user.uid) ? const DoctorSpace() : const Home();
                // }
                // setPageToShow();
                // return pageToShow;
              } else {
                return Login();
              }
            }
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
