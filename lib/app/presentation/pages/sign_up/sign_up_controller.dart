import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/domain/entities/user_response.dart';
import 'package:mobin_app/app/domain/services/user_service.dart';

class SignUpController extends GetxController {

  TextEditingController usernameController           = TextEditingController();
  TextEditingController emailController              = TextEditingController();
  TextEditingController passwordController           = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController               = TextEditingController();
  TextEditingController surnameController            = TextEditingController();
  TextEditingController phoneController              = TextEditingController();

  UserService service = UserService();

  RxBool hidePassword = true.obs;
  RxBool hideConfirmPassword = true.obs;

  RxString firstPasswordToCompare = ''.obs;

  final formKeySignUp = GlobalKey<FormState>();

  void register(/*BuildContext context*/) async {
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

    // TODO: Mostrar rulito
    // final ProgressDialog cargandoWidget = new ProgressDialog(Get.context);
    // cargandoWidget.show();

    User user = User(
      email: email,
      password: password,
      passwordConfirmation: confirmPassword,
      username: username,
      name: name,
      surname: surname,
      phone: phone
    );

    Response response = await service.signUp(user);

    if (response.statusCode == 201) {
      UserResponse userResponse = UserResponse.fromJson(response.body);
      clearForm();
      Get.offNamed('/login');
      // TODO: Loggear y mandar directo al home
    } else {
      Get.snackbar('Error', 'Error al registrarse',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 10,
        margin: EdgeInsets.all(10),
        borderColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        icon: Icon(Icons.error, color: Colors.white)
      );
    }

  }

  void mutateHidePassword() {
    hidePassword.value = !(hidePassword.value);
  }

  void mutateHideConfirmPassword() {
    hideConfirmPassword.value = !(hideConfirmPassword.value);
  }
  
  void clearForm() {
    usernameController.text        = '';
    emailController.text           = '';
    passwordController.text        = '';
    confirmPasswordController.text = '';
    nameController.text            = '';
    surnameController.text         = '';
    phoneController.text           = '';
  }

}