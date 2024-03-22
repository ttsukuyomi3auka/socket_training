import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:socket_training/models/chat_message/chat_message.dart';
import 'package:socket_training/services/socket_service.dart';
import 'package:socket_training/services/user_services.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> get messages => UserService.to.messages;

  final textCntrl = TextEditingController();
  final scrollCntrl = ScrollController();

  @override
  void onInit() {
    messages.listen((p0) async {
      var max = scrollCntrl.position.maxScrollExtent;
      if (scrollCntrl.offset + 100 >= max) {
        await Future.delayed(const Duration(microseconds: 300));
        scrollCntrl.jumpTo(max);
      }
    });
    super.onInit();
  }

  void sendMessage() {
    var message = textCntrl.text;
    SocketService.to.sendMessageToChat(message);
    textCntrl.text = '';
  }

  void disconnect() {
    SocketService.to.disconnect();
  }
}
