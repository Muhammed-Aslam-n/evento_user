import 'package:dio/dio.dart';
import 'package:evento_user/api_helper/model/login.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/authorization/loginController.dart';
import 'package:evento_user/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
        String? accessKey =
            await secureStorage.read(key: accesstokenStorageKey);
        String? refKey = await secureStorage.read(key: refreshTokenStorageKey);
        if (accessKey != null) {
          await secureStorage.delete(key: accesstokenStorageKey);
          await secureStorage.write(
              key: accesstokenStorageKey, value: response.data['access']);
        } else {
          await secureStorage.write(
              key: accesstokenStorageKey, value: response.data['access']);
        }
        if (refKey != null) {
          secureStorage.delete(key: refreshTokenStorageKey);
          await secureStorage.write(
              key: refreshTokenStorageKey, value: response.data['refresh']);
        } else {
          await secureStorage.write(
              key: refreshTokenStorageKey, value: response.data['refresh']);
        }
        await secureStorage.write(key: didUserLoggedKey, value: loggedStatus);
        controller.loginCircularBar();
        Navigator.of(context).popAndPushNamed('holder');
        debugPrint("Login was Successful");
      }
    } on DioError catch (dioError) {
      controller.loginCircularBar();
      commonSnackBar(
        title: "Login",
        message: "Username or Password incorrect",
        bgColor: warningColors,
        color: whiteColor,
      );
      debugPrint(dioError.toString());
    }
  }

  refreshToken() async {
    String? oldAccessToken =
        await secureStorage.read(key: accesstokenStorageKey);
    String? oldRefreshToken =
        await secureStorage.read(key: refreshTokenStorageKey);
    final response = await _dio!
        .post(refreshTokenUrl, data: {'refresh': '$oldRefreshToken'});
    var newAccessToken = response.data;
    // var newRefreshTkn = jsonDecode(response.data)['refresh_token'];
    if (oldAccessToken != newAccessToken) {
      await secureStorage.delete(key: accesstokenStorageKey);
      await secureStorage.write(
          key: accesstokenStorageKey, value: newAccessToken);
      debugPrint("REKSHAPPETTU MONE.... SAADHANAM KAYYILUND");
    }
  }
}
