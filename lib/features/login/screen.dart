import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sante_app/core/navigator/navigator.dart';
import 'package:sante_app/features/login/utils.dart';

import '../../core/custom form field/custom_password_form_field.dart';
import '../../core/custom form field/custom_text_form_field.dart';
import '../../core/custom form field/login_app_bar.dart';
import '../../services/auth/auth.dart';
import '../../services/auth/errors/auth_errors.dart';
import '../signup/switching_screen.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    // final TextEditingController passwordConfirmationController =
    //     TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "DOCTOR+",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Dongle',
                fontWeight: FontWeight.w600,
                color: Color(0xff137fff),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // height: size.height,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "CONNEXION",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //Email
                        CustomTextFormField(
                          controller: emailController,
                          labelText: 'Email',
                          validator: (value) =>
                              EmailValidator.validate(value ?? '')
                                  ? null
                                  : "Please enter a valid email",
                        ),
                        CustomPasswordFormField(
                          controller: passwordController,
                          labelText: 'Password',
                          visibility: true,
                          validator: (value) =>
                              (value!.length < 5) ? 'Password to short' : null,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              await handleUserSignin(emailController.text.trim(), passwordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff137fff),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Je n'ai pas de compte, "),
                            TextButton(
                                onPressed: () {
                                  goToPage(context, const SwitchingSignUp());
                                },
                                child: const Text("créer un compte",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500))),
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
