import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth/auth.dart';

class DoctorSpace extends StatefulWidget {
  final User user;
  const DoctorSpace({Key? key, required this.user}) : super(key: key);

  @override
  State<DoctorSpace> createState() => _DoctorSpaceState();
}

class _DoctorSpaceState extends State<DoctorSpace> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
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
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "Doctor Space",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DoctorSpaceHeader(),
              const SizedBox(height: 10,),
              ExpansionPanelList(
                  elevation: 0,
                  expansionCallback: ((panelIndex, isExpanded) {
                    setState(() {
                      _isExpanded = !isExpanded;
                    });
                  }),
                  children: [
                    ExpansionPanel(
                      backgroundColor: Colors.grey.shade100,
                        isExpanded: _isExpanded,
                        canTapOnHeader: true,
                        headerBuilder: ((context, isExpanded) {
                          return const Text(
                            "Les Rendez-vous démandés",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue
                            ),
                          );
                        }),
                        body: Container(child: Text("data"),))
                  ])
            ],
          ),
        ),
      ),
    );
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
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                        image: ExactAssetImage('assets/default-avatar.png'))),
              ),
              const SizedBox(height: 20,),
              Text(widget.user.email ?? ""),
              const SizedBox(height: 20,),
              TextButton(onPressed: (){
                auth.signOut;
              }, child: const Text("Déconnection"))
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorSpaceHeader extends StatelessWidget {
  const DoctorSpaceHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Welcome,",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "Dr. Vatogba",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Dongle'),
            ),
          ],
        ),
        Expanded(child: Container()),
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              image: DecorationImage(
                  image: ExactAssetImage('assets/default-avatar.png'))),
        )
      ],
    );
  }
}
