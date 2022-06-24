import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/models/chat.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/domain/entities/general_response.dart';
import 'package:mobin_app/app/domain/services/chat_service.dart';
import 'package:mobin_app/app/presentation/pages/home/home_controller.dart';

class ChatsController extends GetxController {

  ChatService service = ChatService();

  String token = GetStorage().read('ACCESS_TOKEN') ?? '';
  User user    = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});

  List<Chat> chats = <Chat>[].obs;

  void getChats() async {
    Response response = await service.getChats(user.id.toString(), token);
    GeneralResponse resp = GeneralResponse.fromJson(response.body);
    List<Chat> chatsData = Chat.fromJsonList(resp.data as List);
    chats.clear();
    chats.addAll(chatsData);
  }

  ChatsController () {
    getChats();
    listenMessage();
  }

  HomeController homeController = Get.find();

  void listenMessage() {
    homeController.socket.on('message/${user.id}', (data) {
      getChats();
    });
  }

  @override
  void onClose() {
    super.onClose();
    homeController.socket.off('message/${user.id}');
  }


}