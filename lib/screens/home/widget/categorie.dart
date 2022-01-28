import 'package:flutter/material.dart';



class Categorie extends StatelessWidget {
  final String imageLink;
  final String categorieName;
  final bool isSelected;
  const Categorie({
    Key? key,
    required this.imageLink,
    required this.categorieName,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.blue
        // color: Color(0xfff4f6fa)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageLink,
            width: 50,
            height: 50,
            color: Colors.white,
          ),
          SizedBox(height: 10,),
          Text(
            categorieName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600
            )
            )
        ],
      ),
    );
  }
}