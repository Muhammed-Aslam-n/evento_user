import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/screens/authentication_screens/login/login_home.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 44.h,
                    width: 49.w,
                    child: Image.asset(
                      "assets/images/authentication/EventoCelebrationIcon.png",
                    ),
                  ),
                ],
              ),
              title: SizedBox(
                height: 70,
                child: CommonText(
                    text: "evento", color: paymentHeadTextColor, size: 50.sp),
              ),
              subtitle: CommonText(
                text: "we build smiles",
                isCenter: TextAlign.center,
                color: const Color(0xFF53575B),
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(
            height: 101.h,
          ),
          Image.asset("assets/images/authentication/splashScreenImage.png"),
          SizedBox(
            height: 75.h,
          ),
          Expanded(
            child: Container(
              height: 64.h,
              width: 64.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: secondaryColor),
              child: IconButton(
                onPressed: () {
                  EventoController.eventoController.setAppLaunched();
                  Get.offAll(()=>LoginHome());
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(
              height: 20.0.h
          ),
        ],
      ),
    );
  }
}
