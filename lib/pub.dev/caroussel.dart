// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:flutter/material.dart';


// class Caroussel extends StatelessWidget {
//   const Caroussel({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 150.0,
//           width: 300.0,
//           child: Carousel(
//             boxFit: BoxFit.cover,
//             autoplay: true,
//             animationCurve: Curves.fastOutSlowIn,
//             animationDuration: Duration(milliseconds: 1000),
//             dotSize: 6.0,
//             dotIncreasedColor: Color(0xFFFF335C),
//             dotBgColor: Colors.transparent,
//             dotPosition: DotPosition.bottomCenter,
//             dotVerticalPadding: 10.0,
//             showIndicator: true,
//             indicatorBgPadding: 7.0,
//             images: const [
//               NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
//               NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
//               // ExactAssetImage("assets/images/LaunchImage.jpg"),
//             ],
//           ),
//       ),
//     ));
//   }
// }