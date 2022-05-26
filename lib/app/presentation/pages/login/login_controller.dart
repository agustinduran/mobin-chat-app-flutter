import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/domain/entities/login_response.dart';
import 'package:mobin_app/app/domain/services/user_service.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool hidePassword = true.obs;

  UserService service = UserService();

  final formKeyLogin = GlobalKey<FormState>();

  Future<LoginResponse> login() async {
    // Make save in all fields
    formKeyLogin.currentState?.save();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    Response response = await service.login(email, password);

    // TODO: Guardar token en preferencias

    return LoginResponse.fromJson(response.body);
  }

  void mutateHidePassword() {
    hidePassword.value = !(hidePassword.value);
  }

}