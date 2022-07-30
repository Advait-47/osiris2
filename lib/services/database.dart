import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ihosiris/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference db = FirebaseFirestore.instance.collection('DB');

  Future updateUserData(UserDetails newUser, String uid) async {
    String username = newUser.username;
    String email = newUser.email;
    String address = newUser.address;
    String phone = newUser.phone;
    print("pop");
    return await db.doc('Users').set({
      uid: {
        "uid": uid,
        "username": newUser.username,
        "email": newUser.email,
        "address": newUser.address,
        "contact": newUser.phone,
      }
    }, SetOptions(merge: true));
  }
}
