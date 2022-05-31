import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/presentation/pages/chats/chats_page.dart';
import 'package:mobin_app/app/presentation/pages/contacts/contacts_page.dart';
import 'package:mobin_app/app/presentation/pages/home/home_controller.dart';
import 'package:mobin_app/app/presentation/pages/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: IndexedStack(
        index: controller.tabIndex.value,
        children: [
          ChatsPage(),
          ContactsPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: _createBottomNavigationBar(context),
    ));
  }
  
  Widget _createBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'chats-label'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: 'contacts-label'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile-label'.tr,
        ),
      ],
      currentIndex: controller.tabIndex.value,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      backgroundColor: Environment.COLOR_PRIMARY,
      onTap: controller.changeTabIndex
    );
  }
}