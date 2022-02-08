import 'package:evento_user/controller/authorization/forgotController.dart';
import 'package:evento_user/controller/event_details_controller/event_name_creating.dart';
import 'package:evento_user/controller/home/homeController.dart';
import 'package:evento_user/controller/user_map_marking/user_map_controller.dart';
import 'package:evento_user/screens/authentication_screens/login/login_home.dart';
import 'package:evento_user/screens/main_screens/home/holder/evento_userhome_holder.dart';
import 'package:evento_user/screens/startup_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'controller/authorization/loginController.dart';
import 'controller/authorization/registerController.dart';
import 'controller/event_details_controller/event_details_fillout_controller.dart';
import 'controller/getx_controller.dart';
import 'controller/profile/profileWholeController.dart';
import 'controller/profile/profile_updation/password_ updating_controller.dart';
import 'controller/profile/profile_updation/updateProfileController.dart';
import 'controller/profile/profile_updation/username_update.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(EventoController());
  Get.put(EventoForgotController());
  Get.put(LoginController());
  Get.put(ShowWholeProfileDetailsController());
  Get.put(RegisterController());
  Get.put(HomeController());
  Get.put(UpdatePasswordController());
  Get.put(UpdateProfileController());
  Get.put(UsernameUpdate());
  Get.put(EventDetailsFilloutController());
  Get.put(EventNameCreatingController());
  Get.put(UserPlaceMarking());

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
          GetPage(name: '/holder', page: () => const HomePageHolder())
        ],
        ),
        designSize: const Size(375, 812),
    );
  }
}


