import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/models/user.dart';

class ProfileController extends GetxController {

  User user = User.fromJson(GetStorage().read('USER_CONNECTED'));

  void signOut() async {
    await GetStorage().remove('USER_CONNECTED');
    await GetStorage().remove('ACCESS_TOKEN');
  }

}