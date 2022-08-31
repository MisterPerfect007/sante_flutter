import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../controllers/categories_controller.dart';

final CategoriesController cc = Get.put(CategoriesController());

Future<String?> upLoadImage(String imageUrl) async {
  if(imageUrl.isEmpty){
    return "";
  }
  final file = File(imageUrl);

   Reference ref = FirebaseStorage.instance.ref()
    .child('image/${cc.signupPhotoNameDoctor}');
  UploadTask uploadTask =ref.putFile(file);
    //.then((p0) async => taskSnapshot = await p0.ref.getDownloadURL())
  TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
  return await taskSnapshot.ref.getDownloadURL();
}
