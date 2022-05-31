import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/presentation/pages/contacts/contacts_controller.dart';

class ContactsPage extends StatelessWidget {
  
  ContactsController controller = Get.put(ContactsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Contacts page')
      )
    );
  }
}