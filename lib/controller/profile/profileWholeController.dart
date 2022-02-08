import 'dart:io';

import 'package:evento_user/api_helper/api_constants.dart';
import 'package:evento_user/api_helper/model/profile/wholeProfileModel.dart';
import 'package:evento_user/api_helper/services/profile/profile_updation/profile_updation_api.dart';
import 'package:evento_user/api_helper/services/profile/showProfile_api.dart';
import 'package:evento_user/controller/profile/profile_updation/updateProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ShowWholeProfileDetailsController extends GetxController {
  static ShowWholeProfileDetailsController showWholeProfileDetailsController =
      Get.find();

  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  UserWholeDetailsModel? userWholeDetailsModel;

  @override
  void onInit() async {
    await checkLogStatus();
    super.onInit();
  }

  String? logStatus;
  String? userName;
  String? userProfilePicture;
  String? email;
  String? phoneNumber;

  Future checkLogStatus() async {
    logStatus = await secureStorage.read(key: didUserLoggedKey);
    if (logStatus == loggedStatus) {
      userWholeDetailsModel =
          await UserWholeProfileAPI().fetchUserWholeDetails();
      UpdateProfileController.updateProfileController.userWholeDetailsModel =
          userWholeDetailsModel;
      userName = userWholeDetailsModel!.name;
      email = userWholeDetailsModel!.email;
      phoneNumber = userWholeDetailsModel!.phoneNumber;
      userProfilePicture = userWholeDetailsModel!.profilePicture;
      debugPrint(
          "On Init Mode of ProfileDetails Show page is  ${userWholeDetailsModel?.name}");
      update();
    }
  }

  File? file;

  selectNewProfile() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null && !file.isBlank!) {
      UpdateProfileAPI().updateUserProfile(imageFile: File(file.path));
    }
  }
}
