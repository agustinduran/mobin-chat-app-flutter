import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:socket_io_client/socket_io_client.dart';

class HomeController extends GetxController {

  User user = User.fromJson(GetStorage().read('USER_CONNECTED') ?? {});

  var tabIndex = 0.obs;

  // TODO: Test with var environment
  Socket socket = io('http://192.168.1.23:3000/chat', <String, dynamic> {
    'transports': ['websocket'],
    'autoConnect': false
  });

  void changeTabIndex(int value) {
    tabIndex.value = value;
  }

  HomeController() {
    connectAndListen();
  }

  void connectAndListen() {
    if (user.id != null) {
      socket.connect();
      print('juju');
      socket.onConnect((data) => {
        print('connected to SocketIO server')
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    socket.disconnect();
  }

}