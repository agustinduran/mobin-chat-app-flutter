import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/chat.dart';

class ChatService extends GetConnect {

  final String _urlChat   = Environment.HOST + Environment.ENDPOINT_CHAT;

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

  // Future<Response> login(String email, String password) async {
  //   Response response = await post(
  //     _urlLogin,
  //     {
  //       'username': email,
  //       'password': password
  //     },
  //     headers: {
  //       'Content-Type': 'application/json'
  //     }
  //   );

  //   return response;
  // }

  // Future<Response> getUser(String email, String password) async {
  //   Response response = await post(
  //     _urlLogin,
  //     {
  //       'username': email,
  //       'password': password
  //     },
  //     headers: {
  //       'Content-Type': 'application/json'
  //     }
  //   );

  //   return response;
  // }

  // Future<Response> getUsers(String token) async {
  //   Response response = await get(
  //     _urlUser,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': token
  //     }
  //   );

  //   return response;
  // }
  
}