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

            if (snapshot.hasData == false) {
              return Center(
                child: Text('error-data'.tr),
              );
            }

            if (snapshot.hasData && snapshot.data?.users?.isNotEmpty == true) {
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

          }),
      )
    );
  }

  Widget _createCardUser(User? user) {
    return ListTile(
      onTap: () => Get.toNamed(Environment.PATH_MESSAGES_PAGE, arguments: {'user': user?.toJson()}),
      title: Text(user?.name ?? ''),
      subtitle: Text(user?.surname ?? ''),
      leading: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: Environment.IMG_USER_PROFILE_PLACEHOLDER,
            image: user?.image ?? Environment.IMG_USER_PROFILE_DEFAULT_EXTERNAL
          ),
        ),
      ),
    );
  }
}