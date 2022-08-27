import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/auth/auth.dart';
import '../../services/firestore/doctors_and_patients.dart';

Future userRole(String uid) async {
  final firestore = Store(FirebaseFirestore.instance);
  print(">>>>>>>>>>\n  \n>>>>>>>>>>");
  dynamic userDoc;
      await firestore.store.doc(uid).get().then((value) { userDoc = value.data();});
  print(">>>>>>>>>>\n ${userDoc["isDoctor"].runtimeType} ::: ${userDoc["isDoctor"]} \n>>>>>>>>>>");
}

Future handleUserSignin(String email, String password) async {
  
  final auth = Auth(FirebaseAuth.instance);
  final errorOrUserCredential =
      await auth.signIn(email: email, password: password);

  errorOrUserCredential.fold((userCredential) async {
    AuthSnackBar.signInSuccess("Vous êtes connecté..", "");
    await userRole(userCredential.user!.uid);
    // userCredential.user?.uid;
    // goToPage(context, page);
  },
      (msg) => Fluttertoast.showToast(
            msg: msg ?? 'An Unexpected error',
            toastLength: Toast.LENGTH_LONG,
          ));
}
