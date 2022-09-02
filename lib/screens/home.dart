import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sante_app/screens/home/widget/categories.dart';

import 'package:sante_app/screens/home/widget/header.dart';
import 'package:sante_app/screens/home/widget/search_input.dart';
import 'package:sante_app/screens/home/widget/top_doctors.dart';

import '../services/auth/auth.dart';

class Home extends StatelessWidget {
  final User user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Icon(
                Icons.menu,
                color: Colors.black87,
                size: 30,
              ),
            ),
          ),
        ),
        drawer: buildDrawer(),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            color: Colors.white,
            child: BodyContent(),
          ),
        ));
  }

  Drawer buildDrawer() {
    final auth = Auth(FirebaseAuth.instance);
    return Drawer(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10, top: 20),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                // decoration: const BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(50)),
                //     image: DecorationImage(
                //         image: ExactAssetImage('assets/default-avatar.png'))),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(user.email ?? ''),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    auth.signOut;
                  },
                  child: const Text("Déconnection"))
            ],
          ),
        ),
      ),
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
    return Column(children: [
      const Header(),
      const SizedBox(height: 30),
      const SearchInput(),
      const SizedBox(height: 15),
      Categories(),
      const SizedBox(height: 30),
      const Expanded(child: TopDoctors())
    ]);
  }
}
