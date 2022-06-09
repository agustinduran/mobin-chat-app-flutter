import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/domain/services/user_service.dart';

class ProfileEditController extends GetxController {

  User user = GetStorage().read('USER_CONNECTED');

  UserService service = UserService();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  TextEditingController nameController    = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController   = TextEditingController();

  ProfileEditController() {
    nameController.text    = user.name ?? '';
    surnameController.text = user.surname ?? '';
    phoneController.text   = user.phone ?? '';
  }

  void editUser(/*BuildContext context*/) async {
    
    String name = nameController.text.trim();
    String surname = surnameController.text;
    String phone = phoneController.text.trim();

    User user = User(
      name: name,
      surname: surname,
      phone: phone
    );

    // Response response = await service.editUser(user);

    // TODO: Mover al page, similar a como está el login
    // if (response.statusCode == 201) {
      // UserResponse userResponse = UserResponse.fromJson(response.body);
      clearForm();
      // Get.offNamed('/login');
      // TODO: Loggear y mandar directo al home
    // } else {
      // TODO: Mejorar error
      // Get.snackbar('Error', 'Error al registrarse',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   borderRadius: 10,
      //   margin: const EdgeInsets.all(10),
      //   borderColor: Colors.red,
      //   colorText: Colors.white,
      //   duration: const Duration(seconds: 3),
      //   icon: const Icon(Icons.error, color: Colors.white)
      // );
    // }

  }
  
  void clearForm() {
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