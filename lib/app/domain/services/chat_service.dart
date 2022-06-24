import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/chat.dart';

class ChatService extends GetConnect {

  final String _urlChat     = Environment.HOST + Environment.ENDPOINT_CHAT;
  final String _urlChatUser = Environment.HOST + Environment.ENDPOINT_CHAT_USER;

  Future<Response> create(Chat chat, String token) async {
    Response response = await post(
      _urlChat,
      chat.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      }
    );

    return response;
  }

  Future<Response> getChats(String idUser, String token) async {
    Response response = await get(
      _urlChatUser + idUser,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      }
    );

    return response;
  }
  
}