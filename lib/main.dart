import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/data/traslation/messages_traslations.dart';
import 'package:mobin_app/app/presentation/pages/home/home_page.dart';
import 'package:mobin_app/app/presentation/pages/login/login_page.dart';
import 'package:mobin_app/app/presentation/pages/sign_up/sign_up_page.dart';

User userConnected = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});
// String token = GetStorage().read('ACCESS_TOKEN');

void main() async {
  await GetStorage.init();
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
      initialRoute: userConnected.id != null ? Environment.PATH_HOME: Environment.PATH_LOGIN_PAGE,
      getPages: [
        GetPage(
          name: Environment.PATH_LOGIN_PAGE,
          page: () => LoginPage()
        ),
        GetPage(
          name: Environment.PATH_SIGN_UP_PAGE,
          page: () => SignUpPage()
        ),
        GetPage(
          name: Environment.PATH_HOME,
          page: () => HomePage()
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