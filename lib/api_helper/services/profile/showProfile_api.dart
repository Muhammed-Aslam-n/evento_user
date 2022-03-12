import 'package:dio/dio.dart';
import 'package:evento_user/api_helper/model/profile/wholeProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../api_constants.dart';

class UserWholeProfileAPI{

  Dio? _dio;
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  UserWholeProfileAPI(){
    _dio = Dio();
  }

  Future<UserWholeDetailsModel?> fetchUserWholeDetails() async{
    debugPrint("Called Function to Fetch UserWhole Details");
    await refreshToken();
    try{
      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      Response fetchUWholeDetailResponse = await _dio!.get(userFullDetailsURL,options: Options(headers: {'Authorization':'Bearer $accessToken'}));
      UserWholeDetailsModel userWholeDetailsModel = UserWholeDetailsModel.fromJson(fetchUWholeDetailResponse.data['success']);
      debugPrint("Completed FetchingUserProfileWholeDetails");
      return userWholeDetailsModel;
    }on DioError catch(dioError){
      debugPrint("ERROR CAUGHT ON FETCHING USER WHOLE DETAILS");
    }
    return null;
  }



  refreshToken() async {
    debugPrint("FetchVendorWholeProfileDetails(): REFRESH TOKEN CALLED");
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
        debugPrint("NEW REFRESH TOKEN CAUGHT on FetchUserWholeProfileDetails");
        // saveVendorProfileDetails();
        // await fetchUserWholeDetails();
      }
    }
  }



}