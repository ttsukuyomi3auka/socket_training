import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_training/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: controller.login,
            onFieldSubmitted: (value) => controller.signIn(),
            decoration: const InputDecoration(
              labelText: 'Логин',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}
