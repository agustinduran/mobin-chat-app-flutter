import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/domain/entities/user.dart';
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

    // TODO: Tratar errores

    print(response.status.code);
    print(response.body);

    clearForm();
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