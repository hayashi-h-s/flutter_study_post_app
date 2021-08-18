import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(DocumentSnapshot doc) {
    this.documentReference = doc.reference;
    final data = doc.data() as Map<String, Object>;
    this.imageURL = data['imageURL'];
    this.userId = data['userId'];
  }

  String imageURL;
  String userId;
  DocumentReference documentReference;
}