import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import '../components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class addPerson extends StatefulWidget {
  const addPerson({Key? key}) : super(key: key);
  static String id = 'add_person';
  @override
  State<addPerson> createState() => _addPersonState();
}

class _addPersonState extends State<addPerson> {
  // final _auth = FirebaseAuth.instance;
  // late String email;
  // late String password;
  bool showSpinner = false;
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
              RoundedButton(
                  colour: Color.fromARGB(255, 51, 51, 51),
                  title: 'Choose Image',
                  onPressed: () {}),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                // onChanged: (value) {
                //   email = value;
                // },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Name'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                // onChanged: (value) {
                //   password = value;
                // },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Location'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Add Person',
                colour: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  // print(email);
                  // print(password);
                  // try {
                  //   final newUser = await _auth.createUserWithEmailAndPassword(
                  //       email: email, password: password);
                  //   if (newUser != null) {
                  //     Navigator.pushNamed(context, homeScreen.id);
                  //   }
                  //   setState(() {
                  //     showSpinner = false;
                  //   });
                  // } catch (e) {
                  //   print(e);
                  // }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
