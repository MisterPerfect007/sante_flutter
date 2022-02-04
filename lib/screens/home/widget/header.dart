import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children:  [
          const Text(
            'Hallo, Dr',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black87
            ),
          ),
          Expanded(child: Container(),),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              image: DecorationImage(
                image: ExactAssetImage('assets/default-avatar.png')
              )
            ),
          )
        ],
      ),
    );
  }
}