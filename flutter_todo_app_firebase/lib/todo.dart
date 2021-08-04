import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.documentReference = doc.reference;

    final data = doc.data() as Map<String, Object>;

    this.title = data['title'];

    final Timestamp timestamp = data['createdAt'];

    this.createdAt = timestamp.toDate();

    var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
    var createdAtSt = formatter.format(createdAt); // DateからString
  }

  String title;
  DateTime createdAt;
  bool isDone = false;
  DocumentReference documentReference;
}


// get sentDateFormatted  {
//   initializeDateFormatting("ja_JP");
//
//   DateTime datetime = DateTime.parse(sentDateJst); // StringからDate
//
//   var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
//   var createdAtSt = formatter.format(datetime); // DateからString
// }