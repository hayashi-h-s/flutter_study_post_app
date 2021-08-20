import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(DocumentSnapshot doc) {
    this.documentReference = doc.reference;
    final data = doc.data() as Map<String, Object>;
    this.profileImageURL = data['imageURL'];
    this.userId = data['userId'];
  }

  String profileImageURL;
  String userId;
  DocumentReference documentReference;
}