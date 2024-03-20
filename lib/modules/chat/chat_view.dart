import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_training/models/socket_event.dart';
import 'package:socket_training/modules/chat/chat_controller.dart';

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
                  itemBuilder: (context, index) {
                    var message = controller.messages[index];

                    switch (message.type) {
                      case SocketEvent.login:
                        return Text("${message.username} вошел в чат!");
                      case SocketEvent.logout:
                        return Text("${message.username} вышел из чата!");
                      case SocketEvent.newMessage:
                        return Text("${message.username} ${message.message}");
                      default:
                        return const SizedBox();
                    }
                  },
                ))),
        const SizedBox(),
        Container(
          child: TextFormField(
            controller: controller.textCntrl,
            onFieldSubmitted: (value) => controller.sendMessage(),
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
    //тута лист view controller.message
  }
}
