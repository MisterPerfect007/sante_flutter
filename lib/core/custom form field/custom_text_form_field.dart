import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.validator,
    required this.controller,
    this.maxLines,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      controller: controller,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        // border: InputBorder.none,
      ),
      validator: validator,
    );
  }
}
