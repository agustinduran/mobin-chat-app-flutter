import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/domain/entities/contacts_response.dart';
import 'package:mobin_app/app/domain/services/user_service.dart';

class ContactsController extends GetxController {

  UserService service = UserService();

  String token = GetStorage().read('ACCESS_TOKEN') ?? '';

  Future<ContactsResponse> getUsers() async {
    Response response = await service.getUsers(token);
    ContactsResponse resp = ContactsResponse.fromJson(response.body);
    return resp;
  }


}