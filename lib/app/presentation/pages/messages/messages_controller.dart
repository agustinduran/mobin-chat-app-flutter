import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/chat.dart';
import 'package:mobin_app/app/data/models/message.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/domain/entities/general_response.dart';
import 'package:mobin_app/app/domain/services/chat_service.dart';
import 'package:mobin_app/app/domain/services/message_service.dart';
import 'package:mobin_app/app/presentation/pages/home/home_controller.dart';

class MessagesController extends GetxController {

  User friend  = User.fromJson(Get.arguments['user']);
  User user    = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});
  String token = GetStorage().read('ACCESS_TOKEN') ?? '';

  int idChat = -1;
  List<Message> messagesList = <Message>[].obs;

  MessageService service  = MessageService();
  ChatService chatService = ChatService();

  TextEditingController messageField = TextEditingController();

  HomeController homeController = Get.find();

  ScrollController scroll = ScrollController();

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
      getMessages();
      listenMessage();
      listenWriting();
    }

    return generalResponse;
  }

  void sendMessage() async {
    String message = messageField.text;

    if (message.isEmpty) {
      return;
    }

    if (idChat.isNegative) {
      return;
    }

    Message messageObject = Message(
      message: message,
      idSender: user.id,
      idReceiver: friend.id,
      idChat: idChat,
      isImage: 0,
      isVideo: 0
    );

    Response response = await service.create(messageObject, token);
    GeneralResponse generalResponse = GeneralResponse.fromJson(response.body);

    if (generalResponse.success == true) {
      messageField.text = '';
      emitMessage();
    }

  }

  void getMessages() async {
    Response response = await service.getMessages(idChat.toString(), token);
    GeneralResponse generalResponse = GeneralResponse.fromJson(response.body);

    List<Message> messages = Message.fromJsonList(generalResponse.data as List);

    messagesList.clear();
    messagesList.addAll(messages);

    Future.delayed(const Duration(milliseconds: 100), () {
      scroll.jumpTo(scroll.position.minScrollExtent);
    });
  }

  // COMUNICATION WITH SOCKET

  void listenMessage() {
    homeController.socket.on('message/$idChat', (data) {
      print('ListenMessageOn');
      getMessages();
    });
  }

  void emitMessage() {
    print('EmitMessage');
    homeController.socket.emit('message', {
      'id_chat': idChat
    });
  }

  var isWriting = false.obs;

  void listenWriting() {
    homeController.socket.on('writing/$idChat/${friend.id}', (data) {
      isWriting.value = true;
      Future.delayed(const Duration(milliseconds: 2000), () {
        isWriting.value = false;
      });
    });
  }

  void emitWriting() {
    print('EmitWriting');
    homeController.socket.emit('writing', {
      'id_chat': idChat,
      'id_user': user.id
    });
  }

}