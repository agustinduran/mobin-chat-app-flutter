import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/domain/entities/login_response.dart';
import 'package:mobin_app/app/domain/services/user_service.dart';

class LoginController extends GetxController {

  RxBool hidePassword = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserService service = UserService();

  GetStorage storage = GetStorage();

  final formKeyLogin = GlobalKey<FormState>();

  Future<LoginResponse> login() async {
    // Make save in all fields
    formKeyLogin.currentState?.save();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    Response response = await service.login(email, password);

    LoginResponse resp = LoginResponse.fromJson(response.body);

    if (resp.success) {
      storage.write('ACCESS_TOKEN', resp.token);
      storage.write('USER_CONNECTED', resp.user);
    }
    
    return resp;
  }

  void mutateHidePassword() {
    hidePassword.value = !(hidePassword.value);
  }

}