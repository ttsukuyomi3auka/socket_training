import 'package:get/get.dart';
import 'package:socket_training/modules/chat/chat_bindings.dart';
import 'package:socket_training/modules/chat/chat_view.dart';
import 'package:socket_training/modules/home/home_bindings.dart';
import 'package:socket_training/modules/home/home_view.dart';
import 'package:socket_training/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.CHAT,
        page: () => const ChatPage(),
        binding: ChatBinding()),
  ];
}
