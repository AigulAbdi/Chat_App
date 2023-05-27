import 'dart:developer';

import 'package:chat_app/app/modules/chat/views/chat_view.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  CollectionReference user = FirebaseFirestore.instance.collection('users');
  Future<void> addUser() {
    return user
        .add({
          'name': name.value,
          'email': email.value,
          'password': password.value,
        })
        .then((value) => log('User Addad'))
        .catchError((error) => log('Failed to add user: $error'));
  }

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.value,
            password: password.value,
          )
          .then(
            (value) => {
              addUser(),
              Get.to(
                () => ChatView(),
              ),
            },
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
            title: 'The password provided is too weak.', onCancel: Get.back);
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: 'The account already exists for that email.',
            onCancel: Get.back);
      }
    } catch (e) {
      log("e===>$e");
    }
  }
}
