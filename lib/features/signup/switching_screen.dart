import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sante_app/core/navigator/navigator.dart';
import 'package:sante_app/features/signup/screen_doctor.dart';
import 'package:sante_app/features/signup/screen_patient.dart';

import '../../core/custom form field/login_app_bar.dart';

class SwitchingSignUp extends StatelessWidget {
  const SwitchingSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildLoginSignupAppBar(context),
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Je m'inscris en tant que :",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: () {
                        goToPage(context, const SignupPatient());
                      },
                      child: const Text("Patient")),
                  const SizedBox(width: 10),
                  const Text("-- ou --"),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        goToPage(context, const SignupDoctor());
                      },
                      child: const Text("Doctor")),
                ])
              ],
            ))),
      ),
    );
  }
}
