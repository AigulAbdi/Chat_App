//import 'package:chat_app/app/data/models/chat/chat_model.dart';
import 'package:chat_app/app/modules/chat/services/chat_services.dart';
//import 'package:chat_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textEditingController = TextEditingController();
  // ChatModel chatModel = chatModel();
  // RxString message = ''.obs;
  // SignupController _signupController = Get.find();
  // CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  Future<void> sendMessages() async {
    final sms = textEditingController.text.trim();
    if (sms != '') {
      await ChatServices.sendMessages(sms);
      textEditingController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamMessages() {
    return ChatServices.getStreamMessages();
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
