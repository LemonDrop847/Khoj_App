// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:khoj_app_hack/pages/add_person.dart';
import 'package:khoj_app_hack/pages/search_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/rounded_button.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);
  static String id = 'home_screen';
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(117, 17, 124, 143),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 17, 124, 143),
          leading: IconButton(
            iconSize: 25,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            Hero(
              tag: 'name',
              child: Center(
                child: SizedBox(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontFamily: 'RubikDirt',
                      fontSize: 60.0,
                      fontWeight: FontWeight.w500,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [TyperAnimatedText('KHOJ')],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Add to Database',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, addPerson.id);
              },
            ),
            RoundedButton(
              title: 'Search for People',
              colour: const Color.fromARGB(255, 51, 51, 51),
              onPressed: () {
                Navigator.pushNamed(context, searchPeople.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
