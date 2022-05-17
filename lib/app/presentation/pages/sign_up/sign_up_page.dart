import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/constants.dart' as app;

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _crearBody(context),
      backgroundColor: app.COLOR_BLACK1
    );
  }
  
  Widget _crearBody(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          _createBannerRegister(),
          _createTextFieldUsername(),
          _createTextFieldPassword(),
          _createTextFieldPasswordConfirmation(),
          _createTextFieldName(),
          _createTextFieldSurname(),
          _createTextFieldEmail(),
          _createTextFieldPhone(),
          _createRegisterButton(),
          _createButtonHaveAccount(),
          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
        ],
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
          color: app.COLOR_PRIMARY
        ),
      ),
    );
  }

    Widget _createTextFieldUsername() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'sign-up-username'.tr,
          hintStyle: const TextStyle(
            color: app.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.person, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createTextFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'sign-up-password'.tr,
          hintStyle: const TextStyle(
            color: app.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.lock, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createTextFieldPasswordConfirmation() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'sign-up-password-conf'.tr,
          hintStyle: const TextStyle(
            color: app.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.lock, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createTextFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'sign-up-name'.tr,
          hintStyle: const TextStyle(
            color: app.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.person, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createTextFieldSurname() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'sign-up-surname'.tr,
          hintStyle: const TextStyle(
            color: app.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.person, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createTextFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'sign-up-email'.tr,
          hintStyle: const TextStyle(
            color: app.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.email, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createTextFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'sign-up-phone'.tr,
          hintStyle: const TextStyle(
            color: app.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.phone, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createRegisterButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      child: ElevatedButton(
        onPressed: () => {},
        child: Text('sign-up-button'.tr),
        style: ElevatedButton.styleFrom(
          primary: app.COLOR_PRIMARY,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
        )
      ),
    );
  }
  
  Widget _createButtonHaveAccount() {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('sign-up-account'.tr, style: TextStyle(color: app.COLOR_PRIMARY)),
        FlatButton(
          onPressed: () => Get.back(),
          child: Text(
            'sign-up-login-button'.tr,
            style: TextStyle(
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
            margin: EdgeInsets.only(top: 50),
            child: Icon(
              Icons.mark_chat_unread,
              size: 100,
              color: app.COLOR_PRIMARY,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'title-banner'.tr,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: app.COLOR_PRIMARY
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'subtitle-banner'.tr,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: app.COLOR_PRIMARY
              )
            ),
          )
        ]
      ),
    );
  }
  
}