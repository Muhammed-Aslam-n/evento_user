import 'package:evento_user/api_helper/services/profile/profile_updation/profile_updation_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController{
  static UpdatePasswordController updatePasswordController = Get.find();


  // Vendor Password Updating
  TextEditingController currentPassword = TextEditingController(text: "Abcd@12").obs();
  TextEditingController newPasswordController = TextEditingController(text: "Abcd@123").obs();


  clearPControllers(){
    currentPassword.clear();
    newPasswordController.clear();
  }

  updatePassword(){
    String currentPass = currentPassword.text;
    String newPassword = newPasswordController.text;
    UpdateProfileAPI().updatePassword(currentPassword: currentPass,newPassword: newPassword);
  }


  @override
  void dispose() {
    currentPassword.dispose();
    newPasswordController.dispose();
    super.dispose();
  }


}