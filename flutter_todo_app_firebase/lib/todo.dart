import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.documentReference = doc.reference;
    final data = doc.data() as Map<String, Object>;
    this.title = data['title'];
    this.userId = data['userId'];
    this.imageURL = data['imageURL'];
    final Timestamp timestamp = data['createdAt'];
    this.createdAt = timestamp.toDate();
    // 作成日時をStringに変換
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    createdAtSt = outputFormat.format(createdAt);
  }

  String title;
  DateTime createdAt;
  String createdAtSt;
  String imageURL;
  bool isDone = false;
  String userId;
  DocumentReference documentReference;
}