import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  TextEditingController usernameController           = TextEditingController();
  TextEditingController emailController              = TextEditingController();
  TextEditingController passwordController           = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController               = TextEditingController();
  TextEditingController surnameController            = TextEditingController();
  TextEditingController phoneController              = TextEditingController();

  RxBool hidePassword = true.obs;
  RxBool hideConfirmPassword = true.obs;

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
    String confirmPassword = confirmPasswordController.text.trim();
    String username = usernameController.text.trim();
    String name = nameController.text.trim();
    String surname = surnameController.text;
    String phone = phoneController.text.trim();

    // final ProgressDialog cargandoWidget = new ProgressDialog(Get.context);
    // cargandoWidget.show();

    // TODO: Llamar service
  }

  void mutateHidePassword() {
    hidePassword.value = !(hidePassword.value);
  }

  void mutateHideConfirmPassword() {
    hideConfirmPassword.value = !(hideConfirmPassword.value);
  }

}