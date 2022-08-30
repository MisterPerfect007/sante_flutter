import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/core/image%20picker/image_picker.dart';
import 'package:sante_app/features/signup/utils.dart';
import 'package:sante_app/services/auth/auth.dart';

import '../../controllers/categories_controller.dart';
import '../../core/custom form field/custom_password_form_field.dart';
import '../../core/custom form field/custom_text_form_field.dart';
import '../../core/custom form field/login_app_bar.dart';
import '../../core/navigator/navigator.dart';
import '../../services/firestore/doctors_and_patients.dart';
import '../login/screen.dart';

class SignupDoctor extends StatelessWidget {
  const SignupDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CategoriesController cc = Get.put(CategoriesController());
    // String userImage = cc.signupPhotoDoctor.toString();

    return Scaffold(
      appBar: buildLoginSignupAppBar(context),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // height: size.height,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
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

class FormContainer extends StatefulWidget {
  FormContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  String? _selectedSpeciality;
  List<String> specialities = [
    "Cardiologue",
    "Neurologue",
    "Dermatologue",
    "Néphrologue",
    "Ophtalmologue",
    "Pneumologue"
  ];
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

  final auth = Auth(FirebaseAuth.instance);

  String? imageUrl;

  @override
  Widget build(BuildContext context) {

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
                child: Icon(Icons.camera_alt, color: Colors.blue),
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
            validator: (value) => value != null &&
                    RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(value)
                ? null
                : "Please enter valid number",
          ),

          //! change to dropdown list
          DropdownButtonFormField(
            hint: const Text("Select a speciality"),
            value: _selectedSpeciality,
            items: specialities
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedSpeciality = value;
              });
            },
            validator: (value) =>
                value != null ? null : "Please enter a speciality",
          ),

          // CustomTextFormField(
          //   controller: specialistController,
          //   labelText: 'Specialist',
          //   validator: (value) => value != null && value.isNotEmpty
          //       ? null
          //       : "Please enter a specialist",
          // ),
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
            onPressed: createAccountHandler,
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
            children: [
              const Text("J'ai un compte, "),
              TextButton(
                onPressed: () => goToPage(context, Login()),
                child: const Text("se connecter",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500)),
              )
            ],
          )
        ],
      ),
    );
  }

  void createAccountHandler() async {
    if (formKey.currentState?.validate() ?? false) {
      imageUrl =  await upLoadImage(cc.signupPhotoDoctor.toString());
      final userCredentialOrError = await auth.signUp(
          email: emailController.text.trim(), password: passwordController.text);
      userCredentialOrError.fold(
        (userCredential) {
          //set user data into firestore
          _setUserDataToFireStore(userCredential);
          // AuthSnackBar.signInSuccess("Compte créer avec Succès", "");
          goToPage(context, Login());
        }, 
        (error) {}
      );
    }
  }

  void _setUserDataToFireStore(UserCredential userCredential) {
    Store(FirebaseFirestore.instance).store.doc(userCredential.user?.uid).set({
      'name': nameController.text.trim(),
      'number': numberController.text.trim(),
      'speciality': _selectedSpeciality,
      'about': aboutController.text.trim(),
      'isDoctor': true,
      'profilImage': imageUrl,
    });
    AuthSnackBar.signInSuccess("Compte créer avec Succès", "");
    // Fluttertoast.showToast(msg: "Compte créer avec Succès");
  }
}
