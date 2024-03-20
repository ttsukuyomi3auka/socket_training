import 'package:get/get.dart';
import 'package:socket_training/modules/chat/chat_controller.dart';

class ChatBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ChatController>(() => ChatController());
  }
}