// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:khoj_app_hack/services/storage_service.dart';
import 'package:khoj_app_hack/services/database_service.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:file_picker/file_picker.dart';

class addPerson extends StatefulWidget {
  const addPerson({Key? key}) : super(key: key);
  static String id = 'add_person';
  @override
  State<addPerson> createState() => _addPersonState();
}

class _addPersonState extends State<addPerson> {
  final Storage storage = Storage();
  final Database database = Database();
  late final path;
  late final fileName;
  late String name = '';
  late String address = '';

  bool showSpinner = false;
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
                    child: SizedBox(
                      height: 100,
                      child: Image.asset('images/logo.png'),
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
                  colour: const Color.fromARGB(255, 51, 51, 51),
                  title: 'Choose Image',
                  onPressed: () async {
                    final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpeg', 'jpg'],
                    );
                    if (results == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No Image Selected'),
                        ),
                      );
                      return;
                    }
                    path = results.files.single.path!;
                    fileName = results.files.single.name;

                    print(path);
                    print(fileName);
                  }),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Name'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  address = value;
                },
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
                  try {
                    storage
                        .uploadFile(path, fileName, name)
                        .then((value) => print('Image Uploaded'));
                    database.addUser(name: name, address: address);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Couldnt Register'),
                      ),
                    );
                  }
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
