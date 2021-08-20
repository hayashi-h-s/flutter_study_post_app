import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserUtil {
  /// アプリ起動時にユーザー情報が存在しないならユーザーを作成するメソッド
  static void createUser(DocumentReference collection, String userId) {
    collection.set({
      'userId': userId,
      'imageURL': '',
      'createdAt': Timestamp.now(),
    });
  }

  /// アプリ起動時にユーザー情報が存在しないならユーザーを作成するメソッド
  static void createUserNotExist() {
    final userId = FirebaseAuth.instance.currentUser.uid;
    final collection =
        FirebaseFirestore.instance.collection('users').doc(userId);
    collection.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // ユーザーが作成済みなら何もしない
      } else
        createUser(collection, userId);
    });
  }
}
