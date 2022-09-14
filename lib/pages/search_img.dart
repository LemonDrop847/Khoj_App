// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:khoj_app_hack/components/rounded_button.dart';
import 'package:file_picker/file_picker.dart';

class searchImg extends StatefulWidget {
  const searchImg({Key? key}) : super(key: key);
  static String id = 'search_image';
  @override
  State<searchImg> createState() => _searchImgState();
}

class _searchImgState extends State<searchImg> {
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
            RoundedButton(
                colour: Colors.black45,
                title: 'Choose Image',
                onPressed: () async {
                  final results = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpeg', 'jpg'],
                  );
                }),
            RoundedButton(
                title: 'Search', colour: Colors.blueAccent, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
