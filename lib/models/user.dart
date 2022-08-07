import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  String uid = '';
  String username = '';
  String email = '';
  String address = '';
  String phone = '';
  String name = '';

  UserDetails.init();
  UserDetails({required this.uid});

  UserDetails.getDetails({
    required this.uid,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'address': address,
      'phone': phone,
    };
  }
}
