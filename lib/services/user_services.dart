import 'package:get/get.dart';
import 'package:socket_training/models/chat_message/chat_message.dart';
import 'package:socket_training/routes/routes.dart';
import 'package:socket_training/services/socket_service.dart';

class UserService extends GetxService {
  static UserService get to => Get.find<UserService>();

  String username = '';
  final messages = RxList<ChatMessage>.empty();

  Future<UserService> init() async {
    return this;
  }

  void login() {
    Get.toNamed(Routes.CHAT);
  }

  void setUsernameAndConnect(String user) {
    username = user;
    SocketService.to.connect();
  }

  void addMessageToList(ChatMessage message) {
    messages.add(message);
  }

  void clearMessage() {
    messages.clear();
  }
}
