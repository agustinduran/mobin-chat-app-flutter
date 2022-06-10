import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/presentation/pages/messages/messages_controller.dart';

class MessagesPage extends StatelessWidget {

  MessagesController controller = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
      body: Column(
        children: [
          _createAppBar(),
          Expanded(
            flex: 1,
            child: _createBody(),
          ),
          _createMessageBox(context)
        ],
      )
    );
  }
  
  _createAppBar() {
    return SafeArea(
      child: ListTile(
        title: Text(
          "${controller.friend.name ?? ''} ${controller.friend.surname ?? ''}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          'disconnected'.tr,
          style: const TextStyle(color: Colors.grey)
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        // TODO: Try to use CircleAvatar()
        trailing: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipOval(
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: Environment.IMG_USER_PROFILE_PLACEHOLDER,
                image: controller.friend.image ?? Environment.IMG_USER_PROFILE_DEFAULT_EXTERNAL
              ),
            ),
          ),
        ),
      ),
    );
  }

  _createMessageBox(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 15,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.image_outlined),
              onPressed: () {},
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.video_call_outlined),
              onPressed: () {},
            ),
          ),
          Expanded(
            flex: 10,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'write-message'.tr,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20)
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          )
        ]
      )
    );
  }
  
  _createBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [],
      )
    );
  }
}