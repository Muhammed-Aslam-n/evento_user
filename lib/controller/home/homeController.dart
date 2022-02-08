import 'package:evento_user/api_helper/api_constants.dart';
import 'package:evento_user/api_helper/model/home/short_details_model.dart';
import 'package:evento_user/api_helper/services/home/home_controller_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController homeController = Get.find();

  @override
  Future onInit() async {
    await checkLogStatus();
    super.onInit();
  }

  static const secureStorage = FlutterSecureStorage();
  String? userName;
  String? userProfileURL;
  String? logStatus;
  UserShortDetails? model;

  checkLogStatus() async {

    logStatus = await secureStorage.read(key: didUserLoggedKey);
    if (logStatus == loggedStatus) {
      model = await HomeControllerAPI().fetchUserShortProfileDetails();
      userName = model?.name;
      userProfileURL = model?.profilePicture;
      debugPrint("Function Called after Registering also and The Resultant value is ${model!.name}, and ${model!.profilePicture} in CheckLog ");
      update();
    }
  }



}