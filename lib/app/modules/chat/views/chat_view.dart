import 'package:chat_app/app/data/models/chat/chat_model.dart';
import 'package:chat_app/widgets/messages/send_messages.dart';
import 'package:chat_app/widgets/messages/stream_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  ChatView({Key? key}) : super(key: key);
  ChatModel _chatModel = ChatModel();
  TextEditingController _editingController = TextEditingController();
  final Stream<QuerySnapshot> _chatStream =
      FirebaseFirestore.instance.collection('chatStream').snapshots();
  final ChatController _chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamMessage(
            chatStream: _chatController.getStreamMessages(),
          ),
          SendMessages(
            controller: _chatController.textEditingController,
            onPressed: () async => _chatController.sendMessages(),
          ),
        ],
      ),
    );
  }
}
