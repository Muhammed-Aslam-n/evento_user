import 'package:evento_user/sceeen/startup_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/colors.dart';
import 'controller/getx_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(EventoController());
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
        ),
        designSize: const Size(375, 812),
    );
  }
}

