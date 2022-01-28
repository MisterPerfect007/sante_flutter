import 'package:flutter/material.dart';
import 'package:sante_app/screens/home/widget/categories.dart';


import 'package:sante_app/screens/home/widget/header.dart';
import 'package:sante_app/screens/home/widget/search_input.dart';
import 'package:sante_app/screens/home/widget/top_doctors.dart';


class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.black87,
          size: 30,
          ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          color: Colors.white,
          child: BodyContent(),
        ),
      )
      );
  }
}

class BodyContent extends StatefulWidget {
  const BodyContent({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        SizedBox(height: 30,),
        SearchInput(),
        SizedBox(height: 15,),
        Categories(),
        SizedBox(height: 30,),
        Expanded(child: TopDoctors())
      ]
    );
  }
}