// import 'dart:convert';

// import 'package:flutter_face_api/face_api.dart';

// class compareFaces {
//   var image1 = new Regula.MatchFacesImage();
//   var image2 = new Regula.MatchFacesImage();
//   var img1 = Image.asset('assets/images/portrait.png');
//   var img2 = Image.asset('assets/images/portrait.png');
//   String _similarity = "nil";
//   String _liveness = "nil";

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {}

//     onPressed: () {
//                   ImagePicker().getImage(source: ImageSource.gallery).then(
//                       (value) => setImage(
//                           first,
//                           io.File(value.path).readAsBytesSync(),
//                           Regula.ImageType.PRINTED));
//                   Navigator.pop(context);
//                 }),
// }
