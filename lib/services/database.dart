import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  String username = '';
  DatabaseService({required this.uid});

  final CollectionReference db = FirebaseFirestore.instance.collection('DB');

  Future updateUserData(String username, String uid, String email) async {
    return await db.doc('Users').set({
      uid: {"uid": uid, "username": username, "email": email}
    }, SetOptions(merge: true));
  }
}
