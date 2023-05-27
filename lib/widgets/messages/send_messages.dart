import 'package:flutter/material.dart';

class SendMessages extends StatelessWidget {
  const SendMessages({
    required this.onPressed,
    required this.controller,
  });
  final void Function()? onPressed;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Введите сообщение',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
