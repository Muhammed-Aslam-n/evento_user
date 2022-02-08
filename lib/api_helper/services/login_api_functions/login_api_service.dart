import 'package:dio/dio.dart';
import 'package:evento_user/api_helper/model/login.dart';
import 'package:evento_user/api_helper/model/profile/wholeProfileModel.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/authorization/loginController.dart';
import 'package:evento_user/controller/home/homeController.dart';
import 'package:evento_user/controller/profile/profileWholeController.dart';
import 'package:evento_user/controller/profile/profile_updation/updateProfileController.dart';
import 'package:evento_user/screens/authentication_screens/forgot_password/register_otp_section.dart';
import 'package:evento_user/screens/authentication_screens/login/login_home.dart';
import 'package:evento_user/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../api_constants.dart';

final controller = LoginController.loginController;

class LoginApiService {
  Dio? _dio;
  static const secureStorage = FlutterSecureStorage();

  LoginApiService() {
    _dio = Dio();
  }

  Future loginVendor(context, EventoLogin loginModel) async {
    try {
      Response response = await _dio!.post(
        loginUrl,
        data: loginModel,
      );
      if (response.statusCode == 200) {
        await secureStorage.write(
            key: accesstokenStorageKey, value: response.data['access']);
        await secureStorage.write(
            key: refreshTokenStorageKey, value: response.data['refresh']);
        await secureStorage.write(key: didUserLoggedKey, value: logoutStatus);

        if (response.data['is_verified'] == false) {
          Get.offUntil(MaterialPageRoute(builder: (BuildContext context) =>const RegisterVendorOTPSection()),(route) => false);
        } else {
          debugPrint("Function to Show UserShortData is Called ");
          await secureStorage.write(key: didUserLoggedKey, value: loggedStatus);
          await HomeController.homeController.checkLogStatus();
          await ShowWholeProfileDetailsController.showWholeProfileDetailsController.checkLogStatus();
          UpdateProfileController.updateProfileController.userWholeDetailsModel = ShowWholeProfileDetailsController.showWholeProfileDetailsController.userWholeDetailsModel;

          Get.offNamedUntil('/holder', (route) => false);
        }
        debugPrint("Stored Access token successfully");
        debugPrint("Login was Successful");
      }
    } on DioError catch (dioError) {
      commonSnackBar(
        title: "Login",
        message: "Username or Password incorrect",
        bgColor: warningColors,
        color: whiteColor,
      );
      debugPrint("Login Exception Caught");
      debugPrint("--------------------------");
      debugPrint(dioError.message.toString());
      debugPrint(dioError.response!.statusMessage.toString());
      debugPrint(dioError.response!.statusCode.toString());
      debugPrint("--------------------------");
    }
  }

  logoutVendor() async {
    await secureStorage.deleteAll();
    await secureStorage
        .write(key: didUserLoggedKey, value: logoutStatus)
        .then((value) => Get.off(() => LoginHome()));
  }

}
