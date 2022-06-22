import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/message.dart';
import 'package:mobin_app/app/presentation/global_widgets/bubble.dart';
import 'package:mobin_app/app/presentation/pages/messages/messages_controller.dart';
import 'package:mobin_app/app/presentation/utilities/relative_time_util.dart';

class MessagesPage extends StatelessWidget {

  MessagesController controller = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
      body: Obx (() => Column(
        children: [
          _createAppBar(),
          Expanded(
            flex: 1,
            child: _createBody(),
          ),
          _createMessageBox(context)
        ],
      )
    ));
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
        subtitle: controller.isWriting.value == true 
        ? Text(
          'user-status-disconnected'.tr,
          style: const TextStyle(color: Colors.grey))
        : Text(
          'user-status-writing'.tr,
          style: const TextStyle(color: Colors.green)
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
              maxLength: 80,
              onChanged: (String text) => controller.emitWriting(),
              controller: controller.messageField,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'chat-message-placeholder'.tr,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20)
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => controller.sendMessage(),
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
        reverse: true,
        controller: controller.scroll,
        children: _createMessages(),
      )
    );
  }

  List<Widget> _createMessages() {
    return controller.messagesList.map((message) {
      return _createIndividualMessage(message);
    }).toList();
  }
  
  Widget _createIndividualMessage(Message message) {
    return Container(
      alignment: message.idSender == controller.user.id 
        ? Alignment.centerRight
        : Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Bubble(
        message: message.message ?? '',
        delivered: true,
        isMe: message.idSender == controller.user.id ? true : false,
        time: RelativeTimeUtil.getRelativeTime(message.timestamp!),
        status: message.status ?? 'SENDED'
      )
    );
  }
}