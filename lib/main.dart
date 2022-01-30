import 'package:evento_user/controller/authorization/forgotController.dart';
import 'package:evento_user/controller/event_details_controller/event_name_creating.dart';
import 'package:evento_user/sceeen/authentication_screens/login/login_home.dart';
import 'package:evento_user/sceeen/startup_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/colors.dart';
import 'controller/authorization/loginController.dart';
import 'controller/authorization/registerController.dart';
import 'controller/event_details_controller/event_details_fillout_controller.dart';
import 'controller/getx_controller.dart';
import 'controller/profile_setup/profile_setup.dart';
import 'controller/profile_updation/password_ updating.dart';
import 'controller/profile_updation/updateProfile.dart';
import 'controller/profile_updation/username_update.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(EventoController());
  Get.put(EventoForgotController());
  Get.put(LoginController());
  Get.put(RegisterController());
  Get.put(ProfileSetupController());
  Get.put(UpdatePasswordController());
  Get.put(UpdateProfileController());
  Get.put(UsernameUpdate());
  Get.put(EventDetailsFilloutController());
  Get.put(EventNameCreatingController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Evento - We build smiles',
          theme: ThemeData(
              primaryColor: primaryColor,
          ),
          home: const SplashScreen(),
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/login', page: () => LoginHome()),
        ],
        ),
        designSize: const Size(375, 812),
    );
  }
}


