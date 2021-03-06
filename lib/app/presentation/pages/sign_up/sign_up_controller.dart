import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  ImagePicker picker = ImagePicker();
  File? imageFile;

  void register(/*BuildContext context*/) async {
    
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String username = usernameController.text.trim();
    String name = nameController.text.trim();
    String surname = surnameController.text;
    String phone = phoneController.text.trim();

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

    // TODO: Mover al page, similar a como está el login
    if (response.statusCode == 201) {
      UserResponse userResponse = UserResponse.fromJson(response.body);
      clearForm();
      Get.offNamed('/login');
      // TODO: Loggear y mandar directo al home
    } else {
      // TODO: Mejorar error
      Get.snackbar('Error', 'Error al registrarse',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        borderColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.error, color: Colors.white)
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

  Future selectImage(ImageSource imgSource) async {
    final XFile? image = await picker.pickImage(source: imgSource);
    if (image != null) {
      imageFile = File(image.path);
      update(); // Update UI (SetState in GetX)
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      child: Text('gallery-label'.tr),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.gallery);
      }
    );

    Widget cameraButton = ElevatedButton(
      child: Text('camera-label'.tr),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.camera);
      }
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('pick-image'.tr),
      actions: [
        galleryButton,
        cameraButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }

}