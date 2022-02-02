import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/controllers/categories_controller.dart';
import 'package:sante_app/screens/aboutDoctor/about_doctor.dart';




class Doctor extends StatelessWidget {
  final String image;
  final String specialiste;
  final String nom;
  bool searching;
  Doctor({
    Key? key,
    required this.image,
    required this.specialiste,
    required this.nom,
    this.searching = false
  }) : super(key: key);


  final CategoriesController cc = Get.put(CategoriesController());
  isFiltered(){
    return cc.filteredDoctorsList.isNotEmpty && !searching;
  }

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => AboutDoctor())
          );
      },
      child: Container(
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
            const SizedBox(width: 10,),
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
                const SizedBox(height: 10,),
                Text(
                  'Dr.  ${nom}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                  ),
                )
              ]
            )
    
          ]
        ),
      ),
    );
  }
}