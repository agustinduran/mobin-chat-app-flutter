import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/user.dart';

class ProfileController extends GetxController {

  User user = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});

  void signOut() {
    GetStorage().remove('USER_CONNECTED');
    GetStorage().remove('ACCESS_TOKEN');
    Get.offNamedUntil(Environment.PATH_LOGIN_PAGE, (route) => false);
  }

}