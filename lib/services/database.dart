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

  //FUNTION I WAS TALKING ABOUT
  Future<UserDetails?> getUserData(String uid) async {
    UserDetails? u = null;
    try {
      await db.doc('Users').get().then(
        (DocumentSnapshot docum) {
          //print(docum.data().runtimeType);
          final data = docum.data() as Map<String, dynamic>;
          u = UserDetails.getDetails(
              uid: uid,
              username: data[uid]['username'].toString(),
              email: data[uid]['email'].toString(),
              address: data[uid]['address'].toString(),
              phone: data[uid]['phone'].toString());
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
      //return null;
    }
  }
}
