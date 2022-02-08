import 'dart:io';

import 'package:dio/dio.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/home/homeController.dart';
import 'package:evento_user/controller/profile/profileWholeController.dart';
import 'package:evento_user/controller/profile/profile_updation/password_%20updating_controller.dart';
import 'package:evento_user/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http_parser/http_parser.dart';

import '../../../api_constants.dart';

class UpdateProfileAPI {
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Dio? _dio;

  UpdateProfileAPI() {
    _dio = Dio();
  }

  // Future updateWholeProfile(final updateModel) async{
  //   debugPrint("Update Whole Profile Called");
  //   try{
  //     await refreshToken();
  //     var accessToken = await secureStorage.read(key: accesstokenStorageKey);
  //     Response userUpdateDetailsResponse = await _dio!.put(path,data: updateModel,options: Options(
  //       headers: {'Authorization': 'Bearer $accessToken'},
  //     ),);
  //
  //     if (userUpdateDetailsResponse.data['error'] == null) {
  //       commonSnackBar(title: "Profile Updation", message: "Success");
  //       await secureStorage
  //           .write(key: didUserLoggedKey, value: loggedStatus)
  //           .then(
  //             (value) => ShowWholeProfileDetailsController.showWholeProfileDetailsController.checkLogStatus()
  //             .then(
  //               (value) => HomeController.homeController.checkLogStatus(),
  //         ),
  //       );
  //       // debugPrint(
  //       //     "The Response AFTER WHOLE PROFILE IS  $updateWholeProfileResponse");
  //     } else {
  //       commonSnackBar(
  //           title: "Setup",
  //           message: userUpdateDetailsResponse.data['error'].toString(),
  //           color: whiteColor,
  //           bgColor: warningColors);
  //     }
  //
  //   }on DioError catch(dioError){
  //     debugPrint("FetchingDetailsUpdation Error Caught");
  //     debugPrint(dioError.message.toString());
  //     debugPrint(dioError.response!.statusCode.toString());
  //     if(dioError.response!.statusCode == 401){
  //
  //     }
  //   }
  //
  // }

  Future updatePassword({currentPassword, newPassword}) async {
    debugPrint("Update Password Called");
    debugPrint("Passwords $currentPassword , $newPassword");
    try {
      Map<String, dynamic> model = {
        'current_password': currentPassword,
        'new_password': newPassword
      };
      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      Response updatePasswordResponse = await _dio!.put(
        userPassUpdateURL,
        data: model,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      debugPrint("The Response after Updating Password  is ${updatePasswordResponse.data}");
      if (updatePasswordResponse.data['error'] != null) {
        commonSnackBar(
          title: "Password",
          message: updatePasswordResponse.data['error'],
          color: whiteColor,
          bgColor: warningColors,
        );
      } else {
        commonSnackBar(
          title: "Password",
          message: "Password Updated Successfully",
          color: whiteColor,
          bgColor: greenColor,
        );
        UpdatePasswordController.updatePasswordController.clearPControllers();
      }
      debugPrint("Response of Password update is $updatePasswordResponse");
    } on DioError catch (dioError) {
      debugPrint('UpdatePassword Error Caught');
      debugPrint(dioError.message);
      debugPrint(dioError.response!.statusCode.toString());
      debugPrint("Response of Password update is ${dioError.response}");
      commonSnackBar(
        title: "Password Updation",
        message: "Update Failed",
        color: whiteColor,
        bgColor: warningColors,
      );
    }
  }

  Future updateUserProfile({required File imageFile}) async {
    debugPrint("User Update Profile Called");
    try {
      String? filePath = imageFile.path;
      String? fileName = imageFile.path.split('/').last;
      debugPrint("File Path $filePath");
      debugPrint("File Name $fileName");
      FormData formData = FormData.fromMap(
        {
          "user_pro_pic": await MultipartFile.fromFile(
            filePath,
            filename: fileName,
            contentType: MediaType("image", fileName.split(".").last),
          ),
        },
      );

      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      Response updateProfilePicResponse = await _dio!.put(
          userProfilePicUpdateURL,
          data: formData,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      debugPrint(
          "Response of Updating User Profile is ${updateProfilePicResponse.data}, Code is ${updateProfilePicResponse.statusCode}");
      if (updateProfilePicResponse.statusCode == 200) {
        await ShowWholeProfileDetailsController
            .showWholeProfileDetailsController
            .checkLogStatus();
        Get.back();
      }
    } on DioError catch (dioError) {
      debugPrint("Error Caught on Updating User Profile");
      debugPrint(dioError.message);
      debugPrint(dioError.response!.statusCode.toString());
    }
  }

  // Future updateEmail(newEmail) async {
  //   debugPrint("Update Password Called");
  //   try {} on DioError catch (dioError) {
  //     debugPrint('Error Caught');
  //   }
  // }
  //
  // Future updatePhoneNumber(newPhoneNumber) async {
  //   debugPrint("Update Password Called");
  //   try {} on DioError catch (dioError) {
  //     debugPrint('Error Caught');
  //   }
  // }

  refreshToken() async {
    debugPrint("UPDATE WHOLE PROFILE : REFRESH TOKEN CALLED");
    String? oldAccessToken =
        await secureStorage.read(key: accesstokenStorageKey);
    String? oldRefreshToken =
        await secureStorage.read(key: refreshTokenStorageKey);
    final response = await _dio!
        .post(refreshTokenUrl, data: {'refresh': '$oldRefreshToken'});
    var newAccessToken = response.data['access'];
    var newRefreshToken = response.data['refresh'];
    if (oldAccessToken != newAccessToken) {
      await secureStorage.write(
          key: accesstokenStorageKey, value: newAccessToken);
      await secureStorage.write(
          key: refreshTokenStorageKey, value: newRefreshToken);
      // if (newRefreshToken != oldRefreshToken &&
      //     newAccessToken != oldAccessToken) {
      //   // lookHere!
      // }
    }
  }
}
