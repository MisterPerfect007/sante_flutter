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
  
  dynamic categorieJsonData;
  loadJson() async {
      String data = await DefaultAssetBundle.of(context).loadString("assets/json/organs.json");
      List<dynamic> list = jsonDecode(data);
      // print(list);
      setState(() {
        categorieJsonData = list;
      });
    }

    @override
    void initState () {
      super.initState();
      loadJson();
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
          Expanded(
            child: ListView.builder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categorieJsonData == null? 0 : categorieJsonData.length,
            itemBuilder: (context, i){
              return Categorie(
                  imageLink: categorieJsonData[i]['image'],
                  categorieName: categorieJsonData[i]['organ']
                );
            }
              ),
          )
        ],
      ),
    );
  }
}
