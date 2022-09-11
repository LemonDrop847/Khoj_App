import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<String?> addUser({
    required String name,
    required String address,
  }) async {
    try {
      CollectionReference people =
          FirebaseFirestore.instance.collection('people');
      // Call the user's CollectionReference to add a new user
      await people.doc(name).set({'name': name, 'location': address});
      return 'success';
    } catch (e) {
      return 'Error adding user';
    }
  }

  Future<String?> getUser(String name) async {
    try {
      CollectionReference people =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await people.doc(name).get();
      final data = snapshot.data() as Map<String, String>;
      return data['location'];
    } catch (e) {
      return 'Error fetching user';
    }
  }
}
