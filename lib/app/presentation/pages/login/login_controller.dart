import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool hidePassword = true.obs;

  final formKeyLogin = GlobalKey<FormState>();

  void login() {
    // Hide keyboard
    // FocusScope.of(context).unfocus();

    // Execute validators
    if (!formKeyLogin.currentState!.validate())
      return;
    
    // Make save in all fields
    formKeyLogin.currentState?.save();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
  }

  void mutateHidePassword() {
    hidePassword.value = !(hidePassword.value);
  }

}