import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/models/chat.dart';
import 'package:mobin_app/app/data/models/message.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/domain/entities/general_response.dart';
import 'package:mobin_app/app/domain/services/chat_service.dart';
import 'package:mobin_app/app/domain/services/message_service.dart';

class MessagesController extends GetxController {

  User friend  = User.fromJson(Get.arguments['user']);
  User user    = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});
  String token = GetStorage().read('ACCESS_TOKEN') ?? '';
  int idChat = -1;

  MessageService service  = MessageService();
  ChatService chatService = ChatService();

  TextEditingController messageField = TextEditingController();

  MessagesController() {
    createChat();
  }

  Future<GeneralResponse> createChat() async {
    Chat chat = Chat(
      idUserTransmitter: user.id,
      idUserReceiver: friend.id
    );

    Response response = await chatService.create(chat, token);
    GeneralResponse generalResponse = GeneralResponse.fromJson(response.body);
    
    if (generalResponse.success == true) {
      idChat = generalResponse.data as int;
    }

    return generalResponse;
  }

  void sendMessage() async {
    String message = messageField.text;

    if (message.isEmpty) {
      return;
    }

    // Message message = Message(
    //   message: message,
    //   idSender: user.id.toString(),
    //   idReceiver: friend.id.toString(),
    //   idChat: 
    //   status: 
    //   url: 
    //   isImage: 
    //   isVideo: 
    //   timestamp: 
    // );
  }

}