import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String?> upLoadImage(String imageUrl) async {
  if(imageUrl.isEmpty){
    return "";
  }
  final file = File(imageUrl);

   Reference ref = FirebaseStorage.instance.ref()
    .child('image/$imageUrl');
  UploadTask uploadTask =ref.putFile(file);
    //.then((p0) async => taskSnapshot = await p0.ref.getDownloadURL())
  TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
  return await taskSnapshot.ref.getDownloadURL();
}