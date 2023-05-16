import 'dart:developer';

import 'package:chat_app/app/modules/home/views/home_view.dart';
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
        .doc('AA11')
        .set({
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
          .then((value) => {
                addUser(),
              })
          .then((value) => {addUser(), Get.to(() => const HomeView())});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
