import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/controllers/categories_controller.dart';




class Doctor extends StatelessWidget {
  final String image;
  final String specialiste;
  final String nom;
  Doctor({
    Key? key,
    required this.image,
    required this.specialiste,
    required this.nom,
  }) : super(key: key);


  final CategoriesController cc = Get.put(CategoriesController());
  isFiltered(){
    return cc.filteredDoctorsList.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isFiltered() ? Color(0xfffff6c8) : Color(0xfff4f6fa),
        // color: Color(0xfff4f6fa),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image)
              )
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                specialiste,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700]
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Dr.  ${nom}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700
                ),
              )
            ]
          )

        ]
      ),
    );
  }
}