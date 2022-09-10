import 'package:flutter/material.dart';
import 'home.dart';

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
            MaterialButton(
                color: Colors.lightBlueAccent,
                child: Text(
                  'Choose Image',
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
