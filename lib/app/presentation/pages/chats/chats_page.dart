import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/presentation/pages/chats/chats_controller.dart';

class ChatsPage extends StatelessWidget {

  ChatsController controller = Get.put(ChatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Chats page')
      )
    );
  }
}