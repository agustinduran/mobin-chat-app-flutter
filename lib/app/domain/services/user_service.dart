import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/domain/entities/user.dart';

class UserService extends GetConnect {

  final String _urlSignUp = Environment.HOST + Environment.ENDPOINT_SIGN_UP;
  // final String urlUser = Environment.HOST + Environment.ENDPOINT_USER;

  Future<Response> signUp(User user) async {

    Response response = await post(
      _urlSignUp,
      user.toJson(),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    print(_urlSignUp);

    return response;
  }
  
}