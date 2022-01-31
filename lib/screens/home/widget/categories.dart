import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sante_app/controllers/categories_controller.dart';

import 'categorie.dart';


class Categories extends StatefulWidget {
  Categories({ Key? key }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final CategoriesController cc = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {

     loadJson() async {
      String data = await DefaultAssetBundle.of(context).loadString("assets/json/organs.json");
      return jsonDecode(data);
    }
    final Future categoriesData = loadJson();
    print(categoriesData as Map);

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
          // ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   // itemCount: categoriesData.length,
          //   itemBuilder: (context, i){
          //     return Categorie(
          //       imageLink: '',
          //       categorieName: '',
          //     );
          //   }
          // )
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       Categorie(
          //         imageLink: 'assets/human_organ_icon/heart.png',
          //         categorieName: 'Coeur'
          //       ),
          //       SizedBox(width: 10),
          //       Categorie(
          //         imageLink: 'assets/human_organ_icon/brain.png',
          //         categorieName: 'Cerveau'
          //       ),
          //       SizedBox(width: 10),
          //       Categorie(
          //         imageLink: 'assets/human_organ_icon/kidney.png',
          //         categorieName: 'Rein',
          //       ),
          //       SizedBox(width: 10),
          //       Categorie(
          //         imageLink: 'assets/human_organ_icon/skin.png',
          //         categorieName: 'Peau',
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
