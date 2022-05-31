import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/domain/entities/login_response.dart';
import 'package:mobin_app/app/presentation/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget {

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Center(
        child: _crearBody(context),
      ),
      backgroundColor: Environment.COLOR_BLACK2,
    );
  }
  
  Widget _crearBody(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Form(
        key: controller.formKeyLogin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _createBannerLogo(context),
            _createTextFieldEmail(),
            Obx(() =>_createTextFieldPassword()),
            _createLoginButton(),
            _createButtonDontHaveAccount(),
            Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }

  Widget _createTextFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 80,
        controller: controller.emailController,
        autofillHints: const [AutofillHints.email],
        validator: (value) {
          if (value!.isEmpty) {
            return 'email-username-required'.tr;
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'login-email'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.email, color: Environment.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createTextFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 40,
        controller: controller.passwordController,
        obscureText: controller.hidePassword.value,
        autofillHints: const [AutofillHints.password],
        validator: (value) {
          if (value!.isEmpty) {
            return 'password-required'.tr;
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'login-password'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY,
          ),
          counterText: '',
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
      ),
    );
  }

  Widget _createLoginButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: ElevatedButton(
        onPressed: () async {
          // Hide keyboard
          // FocusScope.of(context).unfocus();

          // Execute validators
          if (!controller.formKeyLogin.currentState!.validate())
            return null;

          LoginResponse resp = await controller.login();
          if (resp.success) {
            Get.offAllNamed(Environment.PATH_HOME);
          } else {
            Get.snackbar(
              'login-error'.tr,
              'login-error-message'.tr,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Environment.COLOR_PRIMARY,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
        ),
        child: Text('login-button'.tr)
      ),
    );
  }
  
  Widget _createButtonDontHaveAccount() {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('login-no-account'.tr, style: const TextStyle(color: Environment.COLOR_PRIMARY)),
        FlatButton(
          onPressed: () => Get.toNamed(Environment.PATH_SIGN_UP_PAGE),
          child: Text(
            'login-register-button'.tr,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          )
        )
      ],
    );
  }
  
  Widget _createBannerLogo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.1
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: const Icon(
              Icons.mark_chat_unread,
              size: 100,
              color: Environment.COLOR_PRIMARY,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              'title-banner'.tr,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Environment.COLOR_PRIMARY
              )
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              'subtitle-banner'.tr,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Environment.COLOR_PRIMARY
              )
            ),
          )
        ]
      ),
    );
  }

}