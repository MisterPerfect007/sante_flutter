import 'package:flutter/material.dart';
import 'package:sante_app/core/navigator/navigator.dart';

AppBar buildLoginSignupAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      onTap: () => goBack(context),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30,
      ),
    ),
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
  );
}
