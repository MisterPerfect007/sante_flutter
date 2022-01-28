import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sante_app/controllers/categories_controller.dart';

import 'categorie.dart';


class Categories extends StatelessWidget {
  Categories({ Key? key }) : super(key: key);

  final CategoriesController _categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700
              ),
          ),
          SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Categorie(
                  imageLink: 'assets/human_organ_icon/heart.png',
                  categorieName: 'Coeur',
                  isSelected: false,
                ),
                SizedBox(width: 10),
                Categorie(
                  imageLink: 'assets/human_organ_icon/brain.png',
                  categorieName: 'Cerveau',
                  isSelected: false,
                ),
                SizedBox(width: 10),
                Categorie(
                  imageLink: 'assets/human_organ_icon/kidney.png',
                  categorieName: 'Rein',
                  isSelected: false,
                ),
                SizedBox(width: 10),
                Categorie(
                  imageLink: 'assets/human_organ_icon/skin.png',
                  categorieName: 'Peau',
                  isSelected: false,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
