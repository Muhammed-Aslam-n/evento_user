
import 'package:evento_user/api_helper/model/login.dart';
import 'package:evento_user/api_helper/services/login_api_functions/login_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{


  static LoginController loginController = Get.find();

  TextEditingController emailEditingController =
  TextEditingController(text: "aslam@gmail.com");
  TextEditingController passwordEditingController =
  TextEditingController(text: "Abcd@123");

  // Login Vendor

  bool loginCircBar = false.obs();

  loginCircularBar() {
    loginCircBar == true ? loginCircBar = false : loginCircBar = true;
    debugPrint("Value of Login Progress is $loginCircBar");
    update(["loginCircularBar"]);
  }

  loginVendor(context) {
    final model = EventoLogin(
      email: emailEditingController.text,
      password: passwordEditingController.text,
    );
    LoginApiService().loginVendor(context, model);
  }

  clearLoginControllers() {
    emailEditingController.clear();
    passwordEditingController.clear();
  }






  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }
}