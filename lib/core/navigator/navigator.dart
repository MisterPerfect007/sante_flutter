import 'package:flutter/material.dart';

goToPage(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

goBack(BuildContext context){
  return Navigator.pop(context);
}
