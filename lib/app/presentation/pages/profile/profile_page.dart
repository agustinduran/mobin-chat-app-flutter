import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/presentation/pages/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.signOut(),
        backgroundColor: Environment.COLOR_PRIMARY,
        child: const Icon(Icons.power_settings_new)
      ),
      body: SafeArea(
        child: Column(
          children: [
            createCircleImageUser(),
            const SizedBox(height: 20),
            createUserInfo(
                'profile-name'.tr,
                '${controller.user.name ?? ''} ${controller.user.surname ?? ''}',
                Icons.person
            ),
            createUserInfo(
                'profile-email'.tr,
                controller.user.email ?? '',
                Icons.email
            ),
            createUserInfo(
                'profile-phone'.tr,
                controller.user.phone ?? '',
                Icons.phone
            ),
          ],
        ),
      ),
    );
  }

  Widget createUserInfo(String title, String subtitle, IconData iconData) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
      ),
    );
  }

  Widget createCircleImageUser() {
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
                // image: controller.user.image!
                image: 'https://www.ldsdb.com/dadmin/photosfldr/mission/8275_6V5A8958ee.jpg'
            ),
          ),
        ),
      ),
    );
  }
}