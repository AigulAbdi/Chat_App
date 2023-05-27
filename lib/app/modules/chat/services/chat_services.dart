import 'package:chat_app/models/users/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  static Future<void> sendMessages(String sms) async {
    final sender = FirebaseAuth.instance.currentUser;
    if (sender != null) {
      final _userModel = UserModel(
        sender: sender.email!,
        sms: sms,
        dateTime: DateTime.now(),
      );
      final _chats = FirebaseFirestore.instance.collection('chats');
      await _chats.add(_userModel.toJson());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getStreamMessages() {
    return FirebaseFirestore.instance
        .collection('chats')
        .orderBy('dateTime', descending: true)
        .snapshots();
  }
}
