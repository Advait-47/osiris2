import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ihosiris/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final db = FirebaseFirestore.instance;

  Future updateUserData(UserDetails newUser, String uid) async {
    print("pop");
    return await db.collection('users').doc(uid).set({
      "uid": uid,
      "username": newUser.username,
      "email": newUser.email,
      "address": newUser.address,
      "contact": newUser.phone,
      "name": newUser.name,
    });
  }

  //FUNTION I WAS TALKING ABOUT
  Future<UserDetails?> getUserData(String uid) async {
    UserDetails? u = null;
    try {
      await db.collection('users').doc(uid).get().then(
        (DocumentSnapshot docum) {
          //print(docum.data().runtimeType);
          final data = docum.data() as Map<String, dynamic>;
          print("UID : ${uid}");
          print("Data : ${data.values.first}");
          u = UserDetails.getDetails(
              uid: uid,
              username: data['username'].toString(),
              email: data['email'].toString(),
              address: data['address'].toString(),
              phone: data['contact'].toString(),
              name: data['name'].toString());
          //return doc;
          // final data = doc.data() as Map<String, dynamic>;
          // // ...
          // return UserDetails.getDetails(
          //     uid: uid,
          //     username: data[uid]['username'].toString(),
          //     email: data[uid]['email'].toString(),
          //     address: data[uid]['address'].toString(),
          //     phone: data[uid]['phone'].toString());
          // print(u.runtimeType.toString() + " fuck u");
        },
        onError: (e) => print("Error getting document: $e"),
      );
      //return u;
      //print(data.runtimeType);
      // UserDetails.getDetails(
      // uid: uid,
      // username: data[uid]['username'].toString(),
      // email: data[uid]['email'].toString(),
      // address: data[uid]['address'].toString(),
      // phone: data[uid]['phone'].toString());
      return u;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
