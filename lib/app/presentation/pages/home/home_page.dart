import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/presentation/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomeController controller = new HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Home'),
      bottomNavigationBar: _createBottomNavigationBar(context),
    );
  }
  
  Widget _createBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'chats-label'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'contacts-label'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile-label'.tr,
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        print('index: $index');
      },
    );
  }
}