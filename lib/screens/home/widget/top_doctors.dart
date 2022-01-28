import 'package:flutter/material.dart';


class TopDoctors extends StatelessWidget {
  const TopDoctors({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Docteurs',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700
              ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Doctor(),
                  SizedBox(height: 15,),
                  Doctor(),
                  SizedBox(height: 15,),
                  Doctor(),
                  SizedBox(height: 15,),
                  Doctor(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Doctor extends StatelessWidget {
  const Doctor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xfff4f6fa),
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
                image: AssetImage('assets/doctors/doctor1.jpeg')
              )
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cardiologue',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700]
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Dr. ' + 'Hélaine Koffi',
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