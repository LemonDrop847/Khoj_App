import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:khoj_app_hack/locator.dart';
import 'package:khoj_app_hack/pages/onboarding.dart';
import 'package:khoj_app_hack/pages/search_page.dart';
import '/pages/home.dart';
import '/pages/search_img.dart';
import '/pages/search_name.dart';
import '/pages/profile.dart';
import '/pages/add_person.dart';
import '/pages/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Onboarding.id,
      routes: {
        Onboarding.id: (context) => const onboarding(),
        homeScreen.id: (context) => const homeScreen(),
        searchImg.id: (context) => const searchImg(),
        addPerson.id: (context) => const addPerson(),
        searchName.id: (context) => const searchName(),
        personProfile.id: (context) => const personProfile(),
        searchPeople.id: (context) => const searchPeople(),
      },
    );
  }
}
