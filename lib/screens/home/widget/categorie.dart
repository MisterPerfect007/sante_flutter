import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sante_app/controllers/categories_controller.dart';



class Categorie extends StatelessWidget {
  final String imageLink;
  final String categorieName;
  Categorie({
    Key? key,
    required this.imageLink,
    required this.categorieName,
  }) : super(key: key);

  final CategoriesController cc = Get.put(CategoriesController());

  isSelected(){
    return (cc.selectedCategorie.value).toString() == categorieName;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
          cc.setCategorie(categorieName)
      },
      child: Obx( () => Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color:  isSelected() ? Color(0xff137fff) : Color(0xfff4f6fa)
          // color: Color(0xfff4f6fa)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageLink,
              width: 50,
              height: 50,
              color: isSelected() ? Colors.white : Colors.black87,
            ),
            SizedBox(height: 10,),
            Text(
              categorieName,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isSelected() ? Colors.white : Colors.black87,
              )
            )
          ],
        ),
      ),
    ));
  }
}