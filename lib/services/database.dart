import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference osirisCollection =
      FirebaseFirestore.instance.collection('categories');
}
