import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth;
  const Auth(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> get signOut => _firebaseAuth.signOut();

  Future signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
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
