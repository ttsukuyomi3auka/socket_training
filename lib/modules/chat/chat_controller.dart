import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:socket_training/models/chat_message/chat_message.dart';
import 'package:socket_training/services/socket_service.dart';
import 'package:socket_training/services/user_services.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> get messages => UserService.to.messages;

  final textCntrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }
  // bool itsMe(String clientId) {

  // }

  void sendMessage() {
    var message = textCntrl.text;
    SocketService.to.sendMessageToChat(message);
  }

  void disconnect() {
    SocketService.to.disconnect();
  }
}
