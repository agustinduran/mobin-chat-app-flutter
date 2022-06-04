import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/presentation/pages/sign_up/sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _crearBody(context),
      backgroundColor: Environment.COLOR_BLACK1
    );
  }
  
  Widget _crearBody(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Form(
        key: controller.formKeySignUp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            _createBannerRegister(),
            _createCircleImageUser(context),
            _createTextFieldUsername(),
            Obx(() =>_createTextFieldPassword()),
            Obx(() =>_createTextFieldPasswordConfirmation()),
            _createTextFieldName(),
            _createTextFieldSurname(),
            _createTextFieldEmail(),
            _createTextFieldPhone(),
            _createRegisterButton(),
            _createButtonHaveAccount(),
            Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }
  
  Widget _createBannerRegister() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      child: Text(
        'title-sign-up'.tr,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Environment.COLOR_PRIMARY
        ),
      ),
    );
  }

  Widget _createCircleImageUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: GestureDetector(
        onTap: () => controller.showAlertDialog(context),
        child: GetBuilder<SignUpController>(
          builder: (value) => CircleAvatar(
            backgroundImage: controller.imageFile != null ? 
              FileImage(controller.imageFile!) :
              const AssetImage(Environment.IMG_USER_PROFILE_PLACEHOLDER) as ImageProvider,
            backgroundColor: Colors.black,
            radius: 60
          ),
        ),
      ),
    );
  }

  Widget _createTextFieldUsername() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 40,
        autofillHints: const [AutofillHints.username],
        controller: controller.usernameController,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-username'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.person, color: Environment.COLOR_PRIMARY),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'username-required'.tr;
          }
          return null;
        }
      ),
    );
  }

  Widget _createTextFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 40,
        keyboardType: TextInputType.visiblePassword,
        controller: controller.passwordController,
        obscureText: controller.hidePassword.value,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-password'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.lock, color: Environment.COLOR_PRIMARY),
          suffixIcon: IconButton(
            icon: Icon(
              controller.hidePassword.value 
                ? Icons.visibility_off 
                : Icons.visibility,
              color: Colors.black26,
              size: 20,
            ),
            onPressed: () => controller.mutateHidePassword()
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'password-required'.tr;
          }
          controller.firstPasswordToCompare.value = value;
          return null;
        }
      ),
    );
  }

  Widget _createTextFieldPasswordConfirmation() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 40,
        keyboardType: TextInputType.visiblePassword,
        controller: controller.confirmPasswordController,
        obscureText: controller.hideConfirmPassword.value,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-password-conf'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.lock, color: Environment.COLOR_PRIMARY),
          suffixIcon: IconButton(
            icon: Icon(
              controller.hideConfirmPassword.value 
                ? Icons.visibility_off 
                : Icons.visibility,
              color: Colors.black26,
              size: 20,
            ),
            onPressed: () => controller.mutateHideConfirmPassword()
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'password-required'.tr;
          } else if (value.compareTo(controller.firstPasswordToCompare.value) != 0) {
            return 'password-doesnt-match'.tr;
          }
          return null;
        }
      ),
    );
  }

  Widget _createTextFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 80,
        controller: controller.nameController,
        autofillHints: const [AutofillHints.name],
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-name'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.person, color: Environment.COLOR_PRIMARY)
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'name-required'.tr;
          }
          return null;
        }
      ),
    );
  }

  Widget _createTextFieldSurname() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 80,
        autofillHints: const [AutofillHints.familyName],
        keyboardType: TextInputType.name,
        controller: controller.surnameController,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-surname'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.person, color: Environment.COLOR_PRIMARY)
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'surname-required'.tr;
          }
          return null;
        }
      ),
    );
  }

  Widget _createTextFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 80,
        autofillHints: const [AutofillHints.email],
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-email'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.email, color: Environment.COLOR_PRIMARY),
        ),
        validator: (value) {
          String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = RegExp(pattern);
          if (value!.isEmpty)
            return 'email-required'.tr;
          else if (!regex.hasMatch(value))
            return 'email-invalid'.tr;
          else
            return null;
        }
      ),
    );
  }

  Widget _createTextFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 40,
        autofillHints: const [AutofillHints.telephoneNumber],
        controller: controller.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-phone'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.phone, color: Environment.COLOR_PRIMARY)
        ),
        validator: (value) {
          String pattern = r'^(?:\+?1[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$';
          RegExp regex = RegExp(pattern);
          if (value!.isEmpty)
            return 'phone-required'.tr;
          else if (!regex.hasMatch(value))
            return 'phone-invalid'.tr;
          else
            return null;
        },
      ),
    );
  }

  Widget _createRegisterButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      child: ElevatedButton(
        onPressed: () => controller.register(),
        style: ElevatedButton.styleFrom(
          primary: Environment.COLOR_PRIMARY,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
        ),
        child: Text('sign-up-button'.tr),
      ),
    );
  }
  
  Widget _createButtonHaveAccount() {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('sign-up-account'.tr, style: const TextStyle(color: Environment.COLOR_PRIMARY)),
        FlatButton(
          onPressed: () => Get.back(),
          child: Text(
            'sign-up-login-button'.tr,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          )
        )
      ],
    );
  }
  
}