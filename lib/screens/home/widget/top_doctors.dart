import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/controllers/categories_controller.dart';

import 'doctor.dart';

class TopDoctors extends StatefulWidget {
  const TopDoctors({Key? key}) : super(key: key);

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  final CategoriesController cc = Get.put(CategoriesController());

  dynamic doctorsJsonData;
  loadJson() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/doctors.json");
    List<dynamic> list = jsonDecode(data);
    // print(list);
    cc.setAllDoctorsList(list);
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Docteurs',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx( () => ListView.builder(
                itemCount: cc.doctorsList.length,
                itemBuilder: (context, i) {
                  return Doctor(
                      image: cc.doctorsList[i]["id_photo"],
                      specialiste: cc.doctorsList[i]["specialist"],
                      nom: cc.doctorsList[i]["name"]);
                })),
          )
        ],
      ),
    );
  }
}
