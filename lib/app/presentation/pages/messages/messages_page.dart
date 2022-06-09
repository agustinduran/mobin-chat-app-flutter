import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/presentation/pages/messages/messages_controller.dart';

class MessagesPage extends StatelessWidget {

  MessagesController controller = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Messages page')
      )
    );
  }
}