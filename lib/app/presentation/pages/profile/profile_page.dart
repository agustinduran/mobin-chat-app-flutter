import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/presentation/pages/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => Get.toNamed(Environment.PATH_EDIT_PROFILE_PAGE),
            backgroundColor: Environment.COLOR_PRIMARY,
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              controller.signOut();
              Get.offNamedUntil(Environment.PATH_LOGIN_PAGE, (route) => false);
            },
            backgroundColor: Environment.COLOR_PRIMARY,
            child: const Icon(Icons.power_settings_new)
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _createCircleImageUser(),
            const SizedBox(height: 20),
            _createUserInfo(
                'profile-name'.tr,
                '${controller.user.name ?? ''} ${controller.user.surname ?? ''}',
                Icons.person
            ),
            _createUserInfo(
                'profile-email'.tr,
                controller.user.email ?? '',
                Icons.email
            ),
            _createUserInfo(
                'profile-phone'.tr,
                controller.user.phone ?? '',
                Icons.phone
            ),
          ],
        ),
      ),
    );
  }

  Widget _createUserInfo(String title, String subtitle, IconData iconData) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
      ),
    );
  }

  Widget _createCircleImageUser() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: 200,
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipOval(
            child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: Environment.IMG_USER_PROFILE_PLACEHOLDER,
                // TODO: Subir al bucket la imagen por default
                image: controller.user.image ?? 'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'
            ),
          ),
        ),
      ),
    );
  }
}