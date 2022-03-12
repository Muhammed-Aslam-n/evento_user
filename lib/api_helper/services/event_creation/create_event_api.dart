import 'package:dio/dio.dart';
import 'package:evento_user/api_helper/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../screens/main_screens/home/home_page/category/selected_category_vendors.dart';

class UserEventHandlingAPI {
  final secureStorage = const FlutterSecureStorage();
  Dio? _dio;

  UserEventHandlingAPI() {
    _dio = Dio();
  }

  createNewEventApiFn({required eventName , required date}) async {
    debugPrint("Function to Create new Event Called");
    try {
      String? accessToken =
          await secureStorage.read(key: accesstokenStorageKey);
      final data = {
        'event_name':eventName,
        'event_date': date,
      };
      Response createEvenResponse = await _dio!.post(createNewEventURL,data: data,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'},),);
      debugPrint("The Response is $createEvenResponse");
      if (createEvenResponse.statusCode == 200) {
        debugPrint("Creating new Event is a Success");
        // Get.to(() => const SelectedCategoryVendorList());
      }
    } on DioError catch (dioError) {
      debugPrint("Error Caught in New EventCreatingFunction");
      debugPrint(dioError.message);
      debugPrint(dioError.response!.statusMessage);
      debugPrint(dioError.response!.statusCode.toString());
    }
  }



  refreshToken() async {
    debugPrint("createNewEvent(): REFRESH TOKEN CALLED");
    try{
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
        if (newRefreshToken != oldRefreshToken &&
            newAccessToken != oldAccessToken) {
          debugPrint("NEW REFRESH TOKEN CAUGHT on createNewEvent()");
        }
        // return
      }
    }on DioError catch (dioError){
      debugPrint("Error Caught in Refresh token of createNewEvent");
      if(dioError.response!.statusCode == 401){
        debugPrint("Refresh Token Error in Fetching UserShort Details");
        // await refreshToken();
      }
    }
  }



}
