import 'package:evento_user/api_helper/services/forgotpassword_api/forgot_password_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventoForgotController extends GetxController{

   static EventoForgotController eventoFpController = Get.find();


  // Forgot Password Controllers

  TextEditingController fpPhoneNumber = TextEditingController();
  TextEditingController fpOTP = TextEditingController();

  TextEditingController fpNewPassword = TextEditingController();
  TextEditingController fpConfirmNewPassword = TextEditingController();


  // page 1
  bool fpSendOtp = false.obs();

   fpSendOtpF() {
    fpSendOtp == true ? fpSendOtp = false : fpSendOtp = true;

    update(['fpSendOtp']);
  }

  fpNumberVerification() {
    ForgotPasswordAPI().sendPhoneNumber(fpPhoneNumber.text);
  }

  // page 2

   fpVerifyNumberUsingOTP(otp){
    ForgotPasswordAPI().verifyOTP(fpPhoneNumber.text,otp);
   }

   bool fpConfirmOtp = false.obs();
   fpConfirmOtpF(){
     fpConfirmOtp == true ? fpConfirmOtp = false : fpConfirmOtp = true;
     update(['fpConfirmOtp']);
   }

   fpResendOTP(){
     ForgotPasswordAPI().sendPhoneNumber(fpPhoneNumber.text);
   }

   fpUpdatePassword(){
     ForgotPasswordAPI().updateForgotPassword(phoneNumber:fpPhoneNumber.text,newPassword:fpNewPassword.text);
   }



}