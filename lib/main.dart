import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/constants.dart' as app;
import 'package:mobin_app/app/data/traslation/messages_traslations.dart';
import 'package:mobin_app/app/presentation/pages/login/login_page.dart';
import 'package:mobin_app/app/presentation/pages/sign_up/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'title-app'.tr,
      translations: MessageTranslations(),
      locale: Get.deviceLocale,
      initialRoute: app.PATH_LOGIN_PAGE,
      getPages: [
        GetPage(
          name: app.PATH_LOGIN_PAGE,
          page: () => LoginPage()
        ),
        GetPage(
          name: app.PATH_SIGN_UP_PAGE,
          page: () => SignUpPage()
        ),
      ],
      navigatorKey: Get.key,
      theme: ThemeData(
        backgroundColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}