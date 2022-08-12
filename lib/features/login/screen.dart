import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Bienvenue sur ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const CustomTextFormField(labelText: 'Email'),
                        const CustomPasswordFormField(
                            labelText: 'Password', visibility: true),
                        const CustomPasswordFormField(
                            labelText: 'Password confirmation',
                            visibility: false),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff137fff),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            'Créer un Compte',
                            style: TextStyle(),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordFormField extends StatefulWidget {
  final bool visibility;
  final String labelText;

  const CustomPasswordFormField({
    Key? key,
    required this.labelText,
    required this.visibility,
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
      validator: (value) {},
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        // border: InputBorder.none,
      ),
      validator: (value) {},
    );
  }
}
