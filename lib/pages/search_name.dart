import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:khoj_app_hack/services/storage_service.dart';
import 'package:khoj_app_hack/services/database_service.dart';
import 'home.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:file_picker/file_picker.dart';

class searchName extends StatefulWidget {
  const searchName({Key? key}) : super(key: key);
  static String id = 'search_name';
  @override
  State<searchName> createState() => _searchNameState();
}

class _searchNameState extends State<searchName> {
  final Storage storage = Storage();
  final Database database = Database();
  late final path;
  late final fileName;
  late String name = '';
  late String address = '';
  late String searchvalue = "";

  bool showSpinner = false;
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
                onChanged: (value) async {
                  name = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Name to Search'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              RoundedButton(
                  title: 'Search Person',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    setState(() {
                      searchvalue = name;
                    });
                  }),
              FutureBuilder(
                future: storage.downloadURL(searchvalue),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.network(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
