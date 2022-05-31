import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/presentation/pages/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile page')
      )
    );
  }
}