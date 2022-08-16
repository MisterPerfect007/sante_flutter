import 'package:flutter/material.dart';

AppBar buildLoginSignupAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "DOCTOR+",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color(0xff137fff),
            ),
          ),
        ],
      ),
    );
  }