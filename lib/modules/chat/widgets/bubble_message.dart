import 'package:flutter/material.dart';
import 'package:socket_training/models/chat_message/chat_message.dart';

class BubbleMessage extends StatelessWidget {
  final ChatMessage message;
  final bool itsMe;

  const BubbleMessage({super.key, required this.message, required this.itsMe});
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: itsMe? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: itsMe ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}