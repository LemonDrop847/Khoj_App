import 'package:flutter/material.dart';
import 'package:khoj_app_hack/pages/add_person.dart';
import 'package:khoj_app_hack/pages/search_img.dart';
import 'package:khoj_app_hack/pages/search_page.dart';
import 'home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
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
      backgroundColor: Color.fromARGB(117, 17, 124, 143),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 17, 124, 143),
          leading: IconButton(
            iconSize: 25,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
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
              colour: Color.fromARGB(255, 51, 51, 51),
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
