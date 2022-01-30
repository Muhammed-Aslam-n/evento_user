import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/authorization/forgotController.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/data_textfield.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordSectionOne extends StatelessWidget {
  ForgotPasswordSectionOne({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = EventoForgotController.eventoFpController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 36.h,
                  ),
                  Image.asset(
                      "assets/images/authentication/ForgotPasswordNew.png"),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: whiteColor, borderRadius: loginBorderRadius),
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 28.h,
                          ),
                          CommonText(
                            text: "Forgot Password",
                            color: primaryColor,
                            size: 24.sp,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w, right: 36.w),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Phone number",
                                    size: 16.sp,
                                    color: primaryColor,
                                  ),
                                  DataTextFields(
                                    minLength: 9,
                                    controller: controller.fpPhoneNumber,
                                    textInputType: TextInputType.phone,
                                    hintText: "mobile number",
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  const CommonText(
                                    text: "OTP will be sent to this number",
                                    color: warningColors,
                                    weight: FontWeight.w400,
                                    size: 11,
                                  ),
                                  SizedBox(
                                    height: 65.h,
                                  ),
                                  Center(
                                    child: commonButton(
                                      text: "Send OTP",
                                      textSize: 14.0,
                                      width: 150.0.w,
                                      onPressed: () {
                                        validateForm(context);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GetBuilder<EventoForgotController>(
                id: "fpSendOtp",
                builder: (controller) {
                  debugPrint(
                      "Value of SendingOTP in Forgot Password is ${controller.fpSendOtp}");
                  return controller.fpSendOtp
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: SizedBox(
                              height: 100.h,
                              width: 100.w,
                              child: const CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  validateForm(context) {
    if (_formKey.currentState!.validate()) {
      controller.fpSendOtpF();
      controller.fpNumberVerification();
      FocusScope.of(context).unfocus();
    }
  }
}
