import 'dart:developer';

import 'package:chat_app/app/modules/chat/views/chat_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  Future<void> logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.to(() => ChatView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: 'No user found for that email', onCancel: Get.back);
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: 'Wrong password provided for that user', onCancel: Get.back);
      }
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
