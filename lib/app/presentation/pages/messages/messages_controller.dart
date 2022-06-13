import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/models/chat.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/domain/entities/general_response.dart';
import 'package:mobin_app/app/domain/services/chat_service.dart';

class MessagesController extends GetxController {

  User friend  = User.fromJson(Get.arguments['user']);
  User user    = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});
  String token = GetStorage().read('ACCESS_TOKEN') ?? '';

  ChatService service = ChatService();

  MessagesController() {
    createChat();
  }

  Future<GeneralResponse> createChat() async {
    Chat chat = Chat(
      idUserTransmitter: user.id,
      idUserReceiver: friend.id
    );

    Response response = await service.create(chat, token);
    GeneralResponse generalResponse = GeneralResponse.fromJson(response.body);
    return generalResponse;
  }



}