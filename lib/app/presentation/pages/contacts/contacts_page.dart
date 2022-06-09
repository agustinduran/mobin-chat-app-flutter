import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/domain/entities/contacts_response.dart';
import 'package:mobin_app/app/presentation/pages/contacts/contacts_controller.dart';

class ContactsPage extends StatelessWidget {
  
  ContactsController controller = Get.put(ContactsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<ContactsResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.users?.isNotEmpty ?? false) {
              return ListView.builder(
                itemCount: snapshot.data?.users?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data?.users?[index].name ?? ''),
                    subtitle: Text(snapshot.data?.users?[index].surname ?? ''),
                  );
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
        })
    );
  }
}