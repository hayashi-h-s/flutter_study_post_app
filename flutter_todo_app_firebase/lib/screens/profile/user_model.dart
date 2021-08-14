import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(DocumentSnapshot doc) {
    this.documentReference = doc.reference;
    final data = doc.data() as Map<String, Object>;
    this.imageURL = data['imageURL'];
    // this.imageURL = data['imageURL'];
    // final Timestamp timestamp = data['createdAt'];
    // this.createdAt = timestamp.toDate();
    // 作成日時をStringに変換
    // DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    // createdAtSt = outputFormat.format(createdAt);
  }

  // String name;
  // DateTime createdAt;
  // String createdAtSt;
  String imageURL;
  // bool isDone = false;
  DocumentReference documentReference;
}