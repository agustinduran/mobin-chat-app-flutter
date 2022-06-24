import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/user.dart';

class UserService extends GetConnect {

  final String _urlSignUp = Environment.HOST + Environment.ENDPOINT_SIGN_UP;
  final String _urlLogin  = Environment.HOST + Environment.ENDPOINT_LOGIN;
  final String _urlUser   = Environment.HOST + Environment.ENDPOINT_USER;

  Future<Response> signUp(User user) async {
    Response response = await post(
      _urlSignUp,
      user.toJson(),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    return response;
  }

  Future<Response> login(String email, String password) async {
    Response response = await post(
      _urlLogin,
      {
        'username': email,
        'password': password
      },
      headers: {
        'Content-Type': 'application/json'
      }
    );

    return response;
  }

  Future<Response> getUsers(String token) async {
    Response response = await get(
      _urlUser,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      }
    );

    return response;
  }
  
}