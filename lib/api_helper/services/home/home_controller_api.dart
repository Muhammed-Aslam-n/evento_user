import 'package:dio/dio.dart';
import 'package:evento_user/api_helper/api_constants.dart';
import 'package:evento_user/api_helper/model/home/short_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeControllerAPI{

  Dio? _dio;
  HomeControllerAPI(){
    _dio = Dio();
  }
  static const secureStorage = FlutterSecureStorage();

  Future<UserShortDetails?> fetchUserShortProfileDetails() async{
    debugPrint("CALLING FUNCTION TO FETCH LOGGED USER DETAILS");
    try{
      await refreshToken();
      var accessToken = await secureStorage.read(key: accesstokenStorageKey);
      debugPrint("fetchUserShortProfileDetails() : Access token is $accessToken");
      Response userShortProDetails = await _dio!.get(userShortProfileURL,options: Options(headers: {'Authorization':'Bearer $accessToken'}));
      debugPrint("The response of fetchUserShortProfileDetails()  is $userShortProDetails");
      UserShortDetails userShortDetails = UserShortDetails.fromJson(userShortProDetails.data['success']);
      debugPrint("Completed Fetching UserShortProfileDetails");
      return userShortDetails;
    } on DioError catch(dioError){
      debugPrint("UserShortProfileDetails Error Caught");
      debugPrint(dioError.response!.statusMessage);
      debugPrint(dioError.response!.statusCode.toString());
      if(dioError.response!.statusCode == 401 || dioError.response!.statusCode == 403){
        // await refreshToken();
        debugPrint("Authorization error caught on Fetching ShortDetails");
      }
    }
  }



  refreshToken() async {
    debugPrint("saveVendorProfileDetails(): REFRESH TOKEN CALLED");
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
        debugPrint("NEW REFRESH TOKEN CAUGHT");
      }
    }
  }

}