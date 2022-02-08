import 'package:evento_user/api_helper/model/profile/wholeProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController{

  static UpdateProfileController updateProfileController = Get.find();

  // Profile Setup Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  String? profilePic;
  UserWholeDetailsModel? userWholeDetailsModel;

  showFetchedProfileDetails(){
    nameController.text = userWholeDetailsModel!.name??"Not found";
    emailEditingController.text = userWholeDetailsModel!.email??"Not found";
    phoneNumberController.text = userWholeDetailsModel!.phoneNumber??"Not found";
   }


  updateProfile(){
    // final updateModel = UserWholeDetailsModel(name: nameController.text,email: emailEditingController.text,phoneNumber: phoneNumberController.text);
    // UpdateProfileAPI().updateWholeProfile(updateModel);
  }












  clearProfileControllers() {
    nameController.clear();
    phoneNumberController.clear();
    emailEditingController.clear();
  }
  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailEditingController.dispose();
    super.dispose();
  }

}