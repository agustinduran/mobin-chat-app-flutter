import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/data/models/user.dart';
import 'package:mobin_app/app/domain/entities/contacts_response.dart';
import 'package:mobin_app/app/presentation/pages/contacts/contacts_controller.dart';

class ContactsPage extends StatelessWidget {
  
  ContactsController controller = Get.put(ContactsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getUsers(),
          builder: (BuildContext context, AsyncSnapshot<ContactsResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.users?.isNotEmpty ?? false) {
                return ListView.builder(
                  itemCount: snapshot.data?.users?.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.data?.users?[index].id == controller.user.id) {
                      return Container();
                    }
                    return _createCardUser(snapshot.data?.users?[index]);
                  },
                );
              } else {
                return Center(
                  child: Text('no-users-found'.tr),
                );
              }
            } else {
              return Center(
                child: Text('error-data'.tr),
              );
            }
          }),
      )
    );
  }

  Widget _createCardUser(User? user) {
    return ListTile(
      title: Text(user?.name ?? ''),
      subtitle: Text(user?.surname ?? ''),
      leading: AspectRatio(
        aspectRatio: 1,
        child: FadeInImage.assetNetwork(
          placeholder: Environment.IMG_USER_PROFILE_PLACEHOLDER,
          image: user?.image ?? Environment.IMG_USER_PROFILE_DEFAULT_EXTERNAL
        ),
      ),
    );
  }
}