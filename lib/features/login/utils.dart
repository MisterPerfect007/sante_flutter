import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sante_app/screens/home.dart';

import '../../core/navigator/navigator.dart';
import '../../services/auth/auth.dart';
import '../../services/firestore/doctors_and_patients.dart';

Future<bool> isDoctor(String uid) async {
  final firestore = Store(FirebaseFirestore.instance);
  dynamic userDoc;
  bool isUserADoctor = false;
  // await Future.delayed(Duration(seconds: 5));
  await firestore.store.doc(uid).get().then((value) {
    userDoc = value.data();
    isUserADoctor = true;
  });
  return isUserADoctor;
}

Future<UserCredential?> handleUserSignin(String email, String password) async {
  UserCredential? currentUserCredential;
  final auth = Auth(FirebaseAuth.instance);
  final errorOrUserCredential =
      await auth.signIn(email: email, password: password);

  errorOrUserCredential.fold(
    (userCredential) async {
      AuthSnackBar.signInSuccess("Vous êtes connecté..", "");
      //
      currentUserCredential = userCredential;
    },
    (msg) {
      Fluttertoast.showToast(
        msg: msg ?? 'An Unexpected error',
        toastLength: Toast.LENGTH_LONG,
      );
    },
  );
  return currentUserCredential;
}
