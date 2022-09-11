import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:khoj_app_hack/services/storage_service.dart';
import 'package:khoj_app_hack/services/database_service.dart';
import 'home.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firestore_search/firestore_search.dart';

class searchName extends StatefulWidget {
  const searchName({Key? key}) : super(key: key);
  static String id = 'search_name';
  @override
  State<searchName> createState() => _searchNameState();
}

class DataModel {
  final String? name;
  final String? location;

  DataModel({this.name, this.location});

  //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
  //This function in essential to the working of FirestoreSearchScaffold

  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return DataModel(
        name: dataMap['name'],
        location: dataMap['location'],
      );
    }).toList();
  }
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
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Color.fromARGB(0, 17, 124, 143),
      //     leading: IconButton(
      //       iconSize: 25,
      //       icon: Icon(Icons.arrow_back_ios),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     )),
      body: FirestoreSearchScaffold(
        scaffoldBackgroundColor: Color.fromARGB(255, 17, 124, 143),
        searchBodyBackgroundColor: Color.fromARGB(117, 17, 124, 143),
        appBarBackgroundColor: Color.fromARGB(0, 17, 124, 143),
        firestoreCollectionName: 'people',
        searchBy: 'name',
        scaffoldBody: Center(
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
          ],
        )),
        dataListFromSnapshot: DataModel().dataListFromSnapshot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DataModel>? dataList = snapshot.data;
            if (dataList!.isEmpty) {
              return const Center(
                child: Text('No Results Returned'),
              );
            }
            return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final DataModel data = dataList[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FutureBuilder(
                              future: storage.downloadURL('${data.name}'),
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  return SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                      snapshot.data!,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    !snapshot.hasData) {
                                  return const CircularProgressIndicator();
                                }
                                return Container();
                              },
                            ),
                            Text(
                              '${data.name}',
                              style:
                                  TextStyle(fontFamily: 'Nunito', fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, left: 8.0, right: 8.0),
                        child: Text('Located at: ${data.location}',
                            style:
                                TextStyle(fontFamily: 'Avenir', fontSize: 20)),
                      )
                    ],
                  );
                });
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No Results Returned'),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
