import 'package:flutter/material.dart';
import 'package:sante_app/features/signup/screen_doctor.dart';
import 'package:sante_app/screens/appointment/appointment.dart';
import 'package:sante_app/screens/home.dart';
import 'package:sante_app/screens/home/widget/top_doctors.dart';

import 'core/image picker/image_picker.dart';
import 'features/login/screen.dart';
import 'features/signup/screen_patient.dart';
import 'screens/doctor/doctor.dart';

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
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
      ),
      home: Appointment(),
    );
  }
}
