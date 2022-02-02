import 'package:flutter/material.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: Container(
          // color: Colors.teal,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: SafeArea(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                    )),
                Expanded(child: Container()),
                const Icon(
                  Icons.more_vert,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/doctors/doctor6.jpeg'))),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Cardiologue',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            
            Text(
              'Dr. Hélaine Koffi',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Icon(
                    Icons.messenger,
                    color: Colors.blue.shade300,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Icon(
                    Icons.call,
                    color: Colors.yellow.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A propos',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Dr. Hélaine Koffi est une Cardiologue diplomé de l'université Nangui Abrogoua d'Abidjan.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 25, right: 25),
              decoration: BoxDecoration(
                  color: Color(0xff137fff),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                'Prendre un Rendez-vous',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
