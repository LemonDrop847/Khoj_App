import 'package:flutter/material.dart';
import 'package:khoj_app_hack/components/rounded_button.dart';
import '../constants.dart';
import 'home.dart';

class searchName extends StatefulWidget {
  const searchName({Key? key}) : super(key: key);
  static String id = 'search_name';
  @override
  State<searchName> createState() => _searchNameState();
}

class _searchNameState extends State<searchName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black45,
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
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              // onChanged: (value) {
              //   email = value;
              // },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Name'),
            ),
            RoundedButton(
              title: 'Search',
              colour: Colors.lightGreenAccent,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
