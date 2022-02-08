import 'package:dio/dio.dart';
import 'package:evento_user/api_helper/api_constants.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/authorization/forgotController.dart';
import 'package:evento_user/screens/authentication_screens/forgot_password/forgot_otp_section.dart';
import 'package:evento_user/screens/authentication_screens/forgot_password/update_forgot_password/update_forgot_password.dart';
import 'package:evento_user/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

final controller = EventoForgotController.eventoFpController;

class ForgotPasswordAPI {
  Dio? _dio;
  static const secureStorage = FlutterSecureStorage();

  ForgotPasswordAPI() {
    _dio = Dio();
  }

  Future sendPhoneNumber(vendorPhoneNumber) async {
    debugPrint("Phone number entering is $vendorPhoneNumber");
    try {
      Response fpResponse = await _dio!.post(
        fpPhoneNumberSendingURL,
        data: {
          'phone_number': '$vendorPhoneNumber',
        },
      );
      if (fpResponse.data['error'] != null) {
        controller.fpSendOtpF();
        commonSnackBar(
          title: "Forgot Password",
          message: "Some Error occurred",
          color: whiteColor,
          bgColor: warningColors,
        );
      } else {
        controller.fpSendOtpF();
        commonSnackBar(
          title: "Forgot Password",
          message: "OTP has been sent to your Number",
          bgColor: greenColor,
          color: whiteColor,
        );
        Get.off(() => ForgotPasswordOtpSection());
      }
    } on DioError catch (dioError) {
      controller.fpSendOtpF();
      debugPrint("Some Error Occurred");
      commonSnackBar(
        title: "Forgot Password",
        message: "Some Error occurred",
        color: whiteColor,
        bgColor: warningColors,
      );
    }
  }

  Future verifyOTP(phoneNumber,otp) async {
    debugPrint("Phone number IN verify otp is $phoneNumber");
    debugPrint("OTP number IN verify otp is $otp");
    try{
      Response verifyOtpResponse = await _dio!.post(fpOtpVerificationURL,data: {'phone_number':'$phoneNumber','otp':'$otp'});
      if(verifyOtpResponse.data['errors'] != null){
        controller.fpConfirmOtpF();
        commonSnackBar(title: "OTP Verification",message: "Something went wrong",);
      }
      else{
        controller.fpConfirmOtpF();
        commonSnackBar(title: "OTP Verification",message: "Verification Success",color: whiteColor,bgColor: greenColor);
        Get.off(()=>UpdateForgotPassword());
      }
    }on DioError catch(dioError){
      controller.fpConfirmOtpF();
      commonSnackBar(title: "OTP Verification",message: "Something went wrong",color: whiteColor,bgColor: warningColors);
    }
  }



  Future updateForgotPassword({phoneNumber,newPassword}) async{
    debugPrint("The new Password to Update is $newPassword");
    debugPrint("Getting Values are $phoneNumber , $newPassword");
    try{
      Response updateFPswrdResponse = await _dio!.post(updateFPaswdURL,data: {'phone_number':'$phoneNumber','password':'$newPassword'});
      if(updateFPswrdResponse.data['errors'] != null){
        controller.fpConfirmOtpF();
        commonSnackBar(title: "Update Password",message: "Something went wrong",color: whiteColor,bgColor: warningColors);
      }else{
        controller.fpConfirmOtpF();
        commonSnackBar(title: "Update Password",message: "Password Updated Successfully",color: whiteColor,bgColor: greenColor);
        Get.offNamedUntil('/login', (route) => false);
      }

    }on DioError catch(dioError){
      debugPrint("Error Occurred");
      controller.fpConfirmOtpF();
      commonSnackBar(title: "Update Password",message: "Something went wrong",color: whiteColor,bgColor: warningColors);
    }


  }


}
