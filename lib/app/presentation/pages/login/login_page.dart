import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/constants.dart' as app;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Center(
        child: _crearBody(context),
      ),
      backgroundColor: app.COLOR_BLACK2,
    );
  }
  
  Widget _crearBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createBannerLogo(context),
          _createTextFieldEmail(),
          _createTextFieldPassword(),
          _createLoginButton(),
          _createButtonDontHaveAccount()
        ],
      ),
    );
  }

  Widget _createTextFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'login-email'.tr,
          hintStyle: TextStyle(
            color: app.COLOR_PRIMARY
          ),
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.email, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createTextFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        color: app.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'login-password'.tr,
          hintStyle: TextStyle(
            color: app.COLOR_PRIMARY,
          ),
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.lock, color: app.COLOR_PRIMARY)
        ),
      ),
    );
  }

  Widget _createLoginButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: ElevatedButton(
        onPressed: () => Get.updateLocale(Locale('es', 'ES')),
        child: Text('login-button'.tr),
        style: ElevatedButton.styleFrom(
          primary: app.COLOR_PRIMARY,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)
        )
      ),
    );
  }
  
  Widget _createButtonDontHaveAccount() {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('login-no-account'.tr, style: TextStyle(color: app.COLOR_PRIMARY)),
        FlatButton(
          onPressed: () => Get.toNamed(app.PATH_SIGN_UP_PAGE),
          child: Text(
            'login-register-button'.tr,
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