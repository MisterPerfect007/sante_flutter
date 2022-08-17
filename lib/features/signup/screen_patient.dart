import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../../core/custom form field/custom_password_form_field.dart';
import '../../core/custom form field/custom_text_form_field.dart';
import '../../core/custom form field/login_app_bar.dart';

class SignupPatient extends StatelessWidget {
  const SignupPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: buildLoginSignupAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // height: size.height,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: const [
                  SizedBox(height: 30),
                  _FormContainer(),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormContainer extends StatelessWidget {
  const _FormContainer({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmationController =
        TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: const [
              Text(
                "INSCRIPTION",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "(Patient)",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          CustomTextFormField(
            controller: nameController,
            labelText: 'Name',
            validator: (value) => value != null && value.isNotEmpty
                ? null
                : "Please enter your name",
          ),
          //Email
          CustomTextFormField(
            controller: emailController,
            labelText: 'Email',
            validator: (value) => EmailValidator.validate(value ?? '')
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
          CustomPasswordFormField(
            controller: passwordConfirmationController,
            labelText: 'Password confirmation',
            visibility: false,
            validator: (value) =>
                (passwordConfirmationController.text == passwordController.text)
                    ? null
                    : 'Passwords are different',
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                // formKey.currentState?.save();
                print("Email: ${emailController.text}, PassWord: ${passwordController.text}");
                print("name: ${nameController.text}");
              }
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff137fff),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Créer un Compte (Patient)',
              style: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("J'ai un compte, "),
              Text("se connecter",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w500))
            ],
          )
        ],
      ),
    );
  }
}
