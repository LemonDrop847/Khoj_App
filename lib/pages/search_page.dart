import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:khoj_app_hack/pages/search_img.dart';
import 'package:khoj_app_hack/pages/search_name.dart';
import 'home.dart';
import '../components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class searchPeople extends StatefulWidget {
  const searchPeople({Key? key}) : super(key: key);
  static String id = 'search_person';
  @override
  State<searchPeople> createState() => _searchPeopleState();
}

class _searchPeopleState extends State<searchPeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(117, 17, 124, 143),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 17, 124, 143),
          leading: IconButton(
            iconSize: 30,
            icon: Icon(Icons.arrow_back_ios),
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
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 100,
                  ),
                ),
                Hero(
                  tag: 'name',
                  child: SizedBox(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontFamily: 'RubikDirt',
                        fontSize: 60.0,
                        fontWeight: FontWeight.w400,
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
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Search Using Face',
              colour: Color.fromARGB(255, 51, 51, 51),
              onPressed: () {
                Navigator.pushNamed(context, searchImg.id);
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Search Using Name',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, searchName.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
