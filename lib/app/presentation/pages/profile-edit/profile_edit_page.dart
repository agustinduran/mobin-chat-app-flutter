import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobin_app/app/data/environment.dart';
import 'package:mobin_app/app/presentation/pages/profile-edit/profile_edit_controller.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class ProfileEditPage extends StatelessWidget {
  
  ProfileEditController controller = Get.put(ProfileEditController());

  final formKeyEdit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createBody(context),
      bottomNavigationBar: _createEditButton(),
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
  
  Widget _createBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formKeyEdit,
          child: AutofillGroup(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createCircleImageUser(context),
                _createTextFieldName(),
                _createTextFieldSurname(),
                _createTextFieldPhone(),
                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createCircleImageUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: GestureDetector(
        onTap: () => controller.showAlertDialog(context),
        child: GetBuilder<ProfileEditController>(
          builder: (value) => CircleAvatar(
            backgroundImage: controller.imageFile != null 
              ? FileImage(controller.imageFile!)
              : controller.user.image != null
                ? NetworkImage(controller.user.image!)
                : const AssetImage(Environment.IMG_USER_PROFILE_PLACEHOLDER) as ImageProvider,
            backgroundColor: Colors.black,
            radius: 60
          ),
        ),
      ),
    );
  }

  Widget _createTextFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 80,
        controller: controller.nameController,
        autofillHints: const [AutofillHints.name],
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-name'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.person, color: Environment.COLOR_PRIMARY)
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'name-required'.tr;
          }
          return null;
        }
      ),
    );
  }

  Widget _createTextFieldSurname() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 80,
        autofillHints: const [AutofillHints.familyName],
        keyboardType: TextInputType.name,
        controller: controller.surnameController,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-surname'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.person, color: Environment.COLOR_PRIMARY)
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'surname-required'.tr;
          }
          return null;
        }
      ),
    );
  }

  Widget _createTextFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      decoration: BoxDecoration(
        color: Environment.COLOR_SECONDARY,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        maxLength: 40,
        autofillHints: const [AutofillHints.telephoneNumber],
        controller: controller.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: 'sign-up-phone'.tr,
          hintStyle: const TextStyle(
            color: Environment.COLOR_PRIMARY
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.phone, color: Environment.COLOR_PRIMARY)
        ),
        validator: (value) {
          String pattern = r'^(?:\+?1[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$';
          RegExp regex = RegExp(pattern);
          if (value!.isEmpty)
            return 'phone-required'.tr;
          else if (!regex.hasMatch(value))
            return 'phone-invalid'.tr;
          else
            return null;
        },
      ),
    );
  }

  Widget _createEditButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      child: ElevatedButton(
        onPressed: () {
          // Hide keyboard
          FocusScope.of(Get.context!).unfocus();
          // Execute validators
          if (!formKeyEdit.currentState!.validate())
            return;
          // Make save in all fields
          formKeyEdit.currentState?.save();

          ProgressDialog pd = ProgressDialog(context: Get.context);
          pd.show(max: 100, msg: 'progress-dialog-wait'.tr);
          controller.editUser();
          pd.close();
        },
        style: ElevatedButton.styleFrom(
          primary: Environment.COLOR_PRIMARY,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
        ),
        child: Text('sign-up-button'.tr),
      ),
    );
  }
  
  AppBar _createAppBar() {
    return AppBar(
      title: Text('edit-page-label'.tr),
      backgroundColor: Environment.COLOR_PRIMARY
    );
  }
  
}