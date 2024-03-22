import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_training/models/socket_event.dart';
import 'package:socket_training/modules/chat/chat_controller.dart';
import 'package:socket_training/modules/chat/widgets/bubble_message.dart';
import 'package:socket_training/services/user_services.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.messages.length,
                  controller: controller.scrollCntrl,
                  itemBuilder: (context, index) {
                    var message = controller.messages[index];
                    bool itsMe = message.username == UserService.to.username;

                    switch (message.type) {
                      case SocketEvent.login:
                        return Text("${message.username} вошел в чат!");
                      case SocketEvent.logout:
                        return Text("${message.username} вышел из чата!");
                      case SocketEvent.newMessage:
                        return BubbleMessage(message: message, itsMe: itsMe);
                      default:
                        return const SizedBox();
                    }
                  },
                ))),
        const SizedBox(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            controller: controller.textCntrl,
            onEditingComplete: controller.sendMessage,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.send),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              controller.disconnect();
            },
            child: const Text("выйти")),
      ],
    ));
  }
}
