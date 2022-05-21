import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  TextEditingController usernameController           = TextEditingController();
  TextEditingController emailController              = TextEditingController();
  TextEditingController passwordController           = TextEditingController();
  TextEditingController confirmatePasswordController = TextEditingController();
  TextEditingController nameController               = TextEditingController();
  TextEditingController surnameController            = TextEditingController();
  TextEditingController phoneController              = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final formKeySignUp = GlobalKey<FormState>();

  void register(/*BuildContext context*/) {
    // Hide keyboard
    // FocusScope.of(context).unfocus();

    // Execute validators
    if (!formKeySignUp.currentState!.validate())
      return;
    
    // Make save in all fields
    formKeySignUp.currentState?.save();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmatePassword = confirmatePasswordController.text.trim();
    String username = usernameController.text.trim();
    String name = nameController.text.trim();
    String surname = surnameController.text;
    String phone = phoneController.text.trim();

    // final ProgressDialog cargandoWidget = new ProgressDialog(Get.context);
    // cargandoWidget.show();

    // TODO: Llamar service

  }

}