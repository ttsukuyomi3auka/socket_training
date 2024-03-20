import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_training/services/user_services.dart';

class HomeController extends GetxController {
  final login = TextEditingController();

  void signIn() {
    UserService.to.setUsernameAndConnect(login.text);
  }
}
