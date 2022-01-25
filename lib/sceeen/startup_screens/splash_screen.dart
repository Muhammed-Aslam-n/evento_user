import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/sceeen/main_screens/home/holder/evento_userhome_holder.dart';
import 'package:evento_user/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              "assets/images/authentication/EventoCelebrationIcon.png",
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: CommonText(
                text: "evento", color: paymentHeadTextColor, size: 20.sp),
          )
        ],
      ),
      nextScreen: EventoController.eventoController.isAppLaunched??false ? const HomePageHolder() : const OnBoarding(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
