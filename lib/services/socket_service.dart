import 'package:socket_io_client/socket_io_client.dart';
import 'package:get/get.dart';
import 'package:socket_training/models/chat_message/chat_message.dart';
import 'package:socket_training/models/socket_event.dart';
import 'package:socket_training/routes/routes.dart';
import 'package:socket_training/services/user_services.dart';

class SocketService extends GetxService {
  static SocketService get to => Get.find();
  late Socket _socket;
  Future<SocketService> init() async {
    _socket = io(
      'https://masqed.ru',
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .disableReconnection()
          .setPath('/chat/socket.io')
          .build(),
    );
    _socket.onConnect((data) {
      printInfo(info: "socket connected");
      _sendLoginMessage();
      Get.offAndToNamed(Routes.CHAT);
    });

    _socket.onDisconnect((data) {
      printInfo(info: "disconnect");
      Get.offAndToNamed(Routes.HOME);
    });
    _socket.onConnectError((data) => printInfo(info: "aaa"));

    _socket.onAny((event, data) {
      var isKnown = SocketEvent.values.any((el) => el.name == event);
      if (!isKnown) return;
      data['type'] = event;
      var message = ChatMessage.fromJson(data);
      UserService.to.addMessageToList(message);
    });
    return this;
  }

  void connect() {
    _socket.connect();
  }

  void disconnect() {
    _sendLogoutMessage();
    _socket.disconnect();
  }

  void _sendLoginMessage() {
    _socket.emit(SocketEvent.login.name, UserService.to.username);
  }

  void _sendLogoutMessage() {
    _socket.emit(SocketEvent.logout.name);
  }

  void sendMessageToChat(String message) {
    _socket.emit(SocketEvent.newMessage.name, message);
  }
}
