import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(DocumentSnapshot doc) {
    this.documentReference = doc.reference;
    final data = doc.data() as Map<String, Object>;
    this.profileImageURL = data['imageURL'];
    this.userId = data['userId'];
    this.name = data['userName'];
  }

  String profileImageURL;
  String userId;
  String name;
  DocumentReference documentReference;
}
