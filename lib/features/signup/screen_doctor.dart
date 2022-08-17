import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/core/image%20picker/image_picker.dart';

import '../../controllers/categories_controller.dart';
import '../../core/custom form field/custom_password_form_field.dart';
import '../../core/custom form field/custom_text_form_field.dart';
import '../../core/custom form field/login_app_bar.dart';

class SignupDoctor extends StatelessWidget {
  const SignupDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CategoriesController cc = Get.put(CategoriesController());
    // String userImage = cc.signupPhotoDoctor.toString();

    return Scaffold(
      appBar: buildLoginSignupAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // height: size.height,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(height: 30),
                    FormContainer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormContainer extends StatelessWidget {
  const FormContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController numberController = TextEditingController();
    final TextEditingController specialistController = TextEditingController();
    final TextEditingController aboutController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmationController =
        TextEditingController();

    final formKey = GlobalKey<FormState>();

    final CategoriesController cc = Get.put(CategoriesController());
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
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImagePicking()));
            },
            child: Stack(children: [
              Obx(() => CircleAvatar(
                    radius: 55,
                    child: cc.signupPhotoDoctor.isNotEmpty
                        ? ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(200)),
                            child: Image.file(
                              File(cc.signupPhotoDoctor.toString()),
                            ),
                          )
                        : const Text("Photo"),
                  )),
              const Positioned(
                bottom: 5,
                right: 5,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.blue
                ),
              ),
            ]),
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
          //Number
          CustomTextFormField(
            controller: numberController,
            labelText: 'Number',
            validator: (value) => value != null && RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(value)
                ? null
                : "Please enter valid number",
          ),
          //! change to dropdown list
          CustomTextFormField(
            controller: specialistController,
            labelText: 'Specialist',
            validator: (value) => value != null && value.isNotEmpty
                ? null
                : "Please enter a specialist",
          ),
          //
          CustomTextFormField(
            controller: aboutController,
            maxLength: 500,
            maxLines: 2,
            labelText: 'About you',
            validator: (value) => value != null && value.isNotEmpty
                ? null
                : "Please enter your description",
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
                print("Name: ${nameController.text},");
                print("Email: ${emailController.text},");
                print("Number: ${numberController.text},");
                print("Specialite: ${specialistController.text},");
                print("About: ${aboutController.text},");
                print("PassWord: ${passwordController.text}");
                // """);
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
