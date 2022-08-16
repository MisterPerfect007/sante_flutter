import 'package:flutter/material.dart';

class CustomPasswordFormField extends StatefulWidget {
  final bool visibility;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomPasswordFormField({
    Key? key,
    required this.labelText,
    required this.visibility, required this.validator, this.controller,
  }) : super(key: key);

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  IconData _icon = Icons.visibility;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isHidden,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        // border: InputBorder.none,
        suffixIcon: widget.visibility
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _icon = _icon == Icons.visibility_off
                        ? Icons.visibility
                        : Icons.visibility_off;
                    _isHidden = !_isHidden;
                  });
                },
                child: Icon(_icon))
            : null,
      ),
      validator: widget.validator,
      
    );
  }
}