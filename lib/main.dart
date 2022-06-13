import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/data/translation/messages_translations.dart';
import 'package:mobin_app/app/presentation/pages/home/home_page.dart';
import 'package:mobin_app/app/presentation/pages/login/login_page.dart';
import 'package:mobin_app/app/presentation/pages/messages/messages_page.dart';
import 'package:mobin_app/app/presentation/pages/profile-edit/profile_edit_page.dart';
import 'package:mobin_app/app/presentation/pages/sign_up/sign_up_page.dart';

var userConnected = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});
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
      initialRoute: userConnected.id != null ? Environment.PATH_HOME_PAGE: Environment.PATH_LOGIN_PAGE,
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
          name: Environment.PATH_HOME_PAGE,
          page: () => HomePage()
        ),
        GetPage(
          name: Environment.PATH_EDIT_PROFILE_PAGE,
          page: () => ProfileEditPage()
        ),
        GetPage(
          name: Environment.PATH_MESSAGES_PAGE,
          page: () => MessagesPage()
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