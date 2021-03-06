import 'package:evento_user/api_helper/model/registration.dart';
import 'package:evento_user/api_helper/services/register/register_vendor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  static RegisterController registerEventoController = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPwdCntrlr = TextEditingController();
  TextEditingController signupEmailCntrlr = TextEditingController();
  TextEditingController signupPassCntrlr = TextEditingController();


  bool isPostingProgress = false.obs();

  changePostingState() {
    isPostingProgress == true
        ? isPostingProgress = false
        : isPostingProgress = true;
    debugPrint("Value of Register Progress is $isPostingProgress");
    update(["registrationStateChange"]);
  }

  registerVendor(context) async {
    // debugPrint(regDetailList.toString());
    final model = EventoRegistration(
      name: nameController.text,
      username: userNameController.text,
      email: signupEmailCntrlr.text,
      phoneNumber: phoneNumberController.text,
      password: signupPassCntrlr.text,
      password2: confirmPwdCntrlr.text,
    );
    VendorRegisterApi().createVendor(model, context);
  }

  bool isVerifying = false.obs();

  changeVerifyingState() {
    isVerifying == true ? isVerifying = false : isVerifying = true;
    debugPrint("Value of OTP Progress is $isVerifying");
    update(['verificationOTPStateChange']);
  }

  verifyVendorWithOtpAfterRegistration(otpPassword) {
    VendorRegisterApi().verifyRegisteredOtp(otpPassword);
  }

  resendOTP() {
    VendorRegisterApi().resendOTP();
  }

  clearSignupControllers() {
    nameController.clear();
    userNameController.clear();
    phoneNumberController.clear();
    signupEmailCntrlr.clear();
    signupPassCntrlr.clear();
    confirmPwdCntrlr.clear();
  }

}