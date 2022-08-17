import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/categories_controller.dart';

class ImagePicking extends StatefulWidget {
  ImagePicking({Key? key}) : super(key: key);

  @override
  State<ImagePicking> createState() => _ImagePickingState();
}

class _ImagePickingState extends State<ImagePicking> {
  String? currentImage;
  final CategoriesController cc = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    Future pickImage(source) async {
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      if (image == null) return;
      // File()
      setState(() {
        currentImage = image.path;
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_left, size: 30),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentImage != null
                ? Column(children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(200)),
                      child: Image.file(
                        File(currentImage!),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 50)
                  ])
                : Text(''),
            currentImage != null
                ? Container(
                    width: 200,
                    // color: Colors.green,
                    child: ElevatedButton(
                        onPressed: () {
                          cc.setSignupPhotoDoctor(currentImage);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text('Valider')),
                  )
                : Text(''),
            Container(
              width: 200,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => pickImage(ImageSource.gallery),
                      child: Row(
                        children: [
                          const Icon(Icons.photo),
                          const SizedBox(width: 10),
                          Text(currentImage != null
                              ? 'Choisir une autre'
                              : 'Choisir une photo')
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () {
                        print("object");
                        pickImage(ImageSource.camera);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(
                            width: 10,
                          ),
                          Text(currentImage != null
                              ? 'Prendre une autre'
                              : 'Prendre une photo')
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
