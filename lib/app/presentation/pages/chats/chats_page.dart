import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/chat.dart';
import 'package:mobin_app/app/presentation/pages/chats/chats_controller.dart';
import 'package:mobin_app/app/presentation/utilities/relative_time_util.dart';

class ChatsPage extends StatelessWidget {

  ChatsController controller = Get.put(ChatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SafeArea(
        child: 
        controller.chats.isNotEmpty 
          ? ListView(children: _createChats())
          : Center(child: Text('no-users-found'.tr))
      ))
    );
  }

  List<Widget> _createChats() {
    return controller.chats.map((chat) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: _createCardChat(chat)
      );
    }).toList();
  }

  Widget _createCardChat(Chat? chat) {
    return ListTile(
      onTap: () => /*Get.toNamed(Environment.PATH_MESSAGES_PAGE, arguments: {'user': user?.toJson()})*/ {},
      title: Text(controller.user.id == chat?.idUser1 
        ? chat!.nameUser2!
        : chat!.nameUser1!
      ),
      subtitle: Text(chat.lastMessage ?? ''),
      leading: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: Environment.IMG_USER_PROFILE_PLACEHOLDER,
            image: (controller.user.id == chat.idUser1 
              ? chat.imageUser1
              : chat.imageUser1)
            ?? Environment.IMG_USER_PROFILE_DEFAULT_EXTERNAL
          ),
        ),
      ),
      trailing: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 7),
            child: Text(
              RelativeTimeUtil.getRelativeTime(chat.timestamp!),
              style: const TextStyle(fontSize: 12, color: Colors.grey)

            ),
          ),
          (chat.unreadMessage ?? 0) > 0 
            ? _circleMessageUnread(chat.unreadMessage ?? 0)
            : const SizedBox(height: 0)
        ],
      )
    );
  }

  Widget _circleMessageUnread(int number) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: 25,
          width: 25,
          color: Environment.COLOR_PRIMARY,
          alignment: Alignment.center,
          child: Text(
            number.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

}