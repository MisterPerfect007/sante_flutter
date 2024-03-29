import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/controllers/categories_controller.dart';
import 'package:sante_app/core/navigator/navigator.dart';
import 'package:sante_app/screens/appointment/appointment.dart';

class AboutDoctor extends StatelessWidget {
  final String id;
  AboutDoctor({
    Key? key,
    required this.id,
  }) : super(key: key);
  final CategoriesController cc = Get.put(CategoriesController());

  retrieveDoctor() {
    return cc.allDoctorsList.firstWhere((element) => element["id"] == id);
    // print(doctor);
  }

  @override
  Widget build(BuildContext context) {
    Map doctor = retrieveDoctor();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: Container(
          // color: Colors.teal,
          padding: const EdgeInsets.only(left: 15, right: 15),
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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(doctor["id_photo"]))),
              ),
              const SizedBox(height: 30),
              Text(
                doctor["specialist"],
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 15),
              Text(
                'Dr. ${doctor["name"]}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30
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
                  const SizedBox(
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
              const SizedBox(
                height: 15,
              ),
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
                      doctor["desc"],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => goToPage(context, const Appointment()),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 25, right: 25),
                  decoration: const BoxDecoration(
                      color: Color(0xff137fff),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    'Prendre un Rendez-vous',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
