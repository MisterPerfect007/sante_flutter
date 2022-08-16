import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../core/custom form field/custom_password_form_field.dart';
import '../../core/custom form field/custom_text_form_field.dart';
import '../../core/custom form field/login_app_bar.dart';

class SignupDoctor extends StatelessWidget {
  const SignupDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmationController =
        TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: buildLoginSignupAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // height: size.height,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 30),
                  buildForm(formKey, emailController, passwordController,
                      passwordConfirmationController),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form buildForm(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController passwordConfirmationController,
  ) {
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
                "(Doctor)",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          //
          Stack(children: const [
             CircleAvatar(
              radius: 55,
              child: Text("data"),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Icon(
                Icons.camera_alt,
              ),
            ),
          ]),

          //Email
          CustomTextFormField(
            controller: emailController,
            labelText: 'Email',
            validator: (value) => EmailValidator.validate(value ?? '')
                ? null
                : "Please enter a valid email",
          ),
          //Number
          CustomTextFormField(
            controller: emailController,
            labelText: 'Number',
            validator: (value) => EmailValidator.validate(value ?? '')
                ? null
                : "Please enter a valid email",
          ),
          //
          CustomTextFormField(
            controller: emailController,
            labelText: 'Specialist',
            validator: (value) => EmailValidator.validate(value ?? '')
                ? null
                : "Please enter a valid email",
          ),
          //
          CustomTextFormField(
            controller: emailController,
            maxLength: 500,
            maxLines: 2,
            labelText: 'A propos',
            validator: (value) => EmailValidator.validate(value ?? '')
                ? null
                : "Please enter a valid email",
          ),
          //

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
                print(
                    "Email: ${emailController.text}, PassWord: ${passwordController.text}");
              }
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff137fff),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Créer un Compte (Doctor)',
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
