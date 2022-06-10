import 'package:get/get.dart';
import 'package:mobin_app/app/data/models/user.dart';

class MessagesController extends GetxController {

  User friend = User.fromJson(Get.arguments['user']);

}