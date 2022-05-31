import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/models/user.dart';

class HomeController extends GetxController {

  User user = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});

  var tabIndex = 0.obs;

  HomeController() {
    print(user);
  }

  void changeTabIndex(int value) {
    tabIndex.value = value;
  }

}