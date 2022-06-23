import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/message.dart';

class MessageService extends GetConnect {

  final String _urlMessage   = Environment.HOST + Environment.ENDPOINT_MESSAGE;

  Future<Response> create(Message message, String token) async {
    Response response = await post(
      _urlMessage,
      message.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      }
    );

    return response;
  }

  Future<Response> getMessages(String idChat, String token) async {
    Response response = await get(
      _urlMessage + idChat,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      }
    );

    return response;
  }

  Future<Response> updateMessageToSeen(String idMessage, String token) async {
    Response response = await patch(
      _urlMessage + idMessage,
      {},
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      }
    );

    return response;
  }
  
}