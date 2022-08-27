import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/services/auth/errors/auth_errors.dart';

class Auth {
  final FirebaseAuth _firebaseAuth;
  const Auth(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> get signOut => _firebaseAuth.signOut();

  Future<Either<UserCredential, String?>> signIn(
      {required String email, required String password}) async {
    try {
      return Left(await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password));
      
    } on FirebaseAuthException catch (e) {
      AuthSnackBar.signInError(getCustomErrorMsgFromCode(e.code), "");
      print(">>>>>>>>>>>>>>>${e.code}");
      return Right(e.code);
    }
  }

  Future<Either<UserCredential, String?>> signUp(
      {required String email, required String password}) async {
    try {
      return Left(await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password));
    } on FirebaseAuthException catch (e) {
      return Right(e.message);
    }
  }
}

class AuthSnackBar{
  static signInError(String title, String message){
    Get.snackbar(
        title,
        message,
        // backgroundColor: Colors.red,
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
  }
  static signInSuccess(String title, String message){
    Get.snackbar(
        title,
        message,
        // backgroundColor: Colors.red,
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
  }
}