import 'package:flutter/material.dart';
import 'package:khoj_app_hack/services/storage_service.dart';
import 'home.dart';
import 'package:khoj_app_hack/services/database_service.dart';

class personProfile extends StatefulWidget {
  const personProfile({Key? key}) : super(key: key);
  static String id = 'view_profile';

  @override
  State<personProfile> createState() => _personProfileState();
}

class _personProfileState extends State<personProfile> {
  final Storage storage = Storage();
  final String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              iconSize: 25,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: storage.downloadURL(name),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Container(
                      width: 300,
                      height: 300,
                      child: Image.network(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) return CircularProgressIndicator();
                  return Container();
                }),
          ],
        ));
  }
}
