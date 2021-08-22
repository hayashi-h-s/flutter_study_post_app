import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserUtil {
  static bool isExistUser = false;

  /// アプリ起動時にユーザー情報が存在しないならユーザーを作成するメソッド
  static void setUserData(DocumentReference collection, String userName,
      String userId, String imageURL) {
    collection.set({
      'userId': userId,
      'userName': userName,
      'imageURL': imageURL,
      'createdAt': Timestamp.now(),
    });
  }

  /// アプリ起動時にユーザー情報が存在しないならユーザーを作成するメソッド
  static Future<bool> checkUserExist() async {
    final userId = FirebaseAuth.instance.currentUser.uid;
    final collection =
        FirebaseFirestore.instance.collection('users').doc(userId);

    await collection.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // ユーザーが作成済みなら何もしない
        isExistUser = true;
      } else {
        // ユーザーが未作成なら登録画面へ
        setUserData(collection, userId, "名無し", "");
        isExistUser = false;
      }
    });
    return isExistUser;
  }
}
