import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:khoj_app_hack/pages/search_page.dart';
import '/pages/home.dart';
import '/pages/search_img.dart';
import '/pages/search_name.dart';
import '/pages/profile.dart';
import '/pages/add_person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homeScreen.id,
      routes: {
        homeScreen.id: (context) => homeScreen(),
        searchImg.id: (context) => searchImg(),
        addPerson.id: (context) => addPerson(),
        searchName.id: (context) => searchName(),
        personProfile.id: (context) => personProfile(),
        searchPeople.id: (context) => searchPeople(),
      },
    );
  }
}
