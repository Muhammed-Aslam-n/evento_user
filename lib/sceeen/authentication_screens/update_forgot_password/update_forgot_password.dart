import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/authorization/forgotController.dart';
import 'package:evento_user/widgets/auth_fields.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:the_validator/the_validator.dart';

class UpdateForgotPassword extends StatelessWidget {
  UpdateForgotPassword({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = EventoForgotController.eventoFpController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 36.h,
                    ),
                    Image.asset(
                      "assets/images/newImages/loginImagen.png",
                      height: 200,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: whiteColor,
                            borderRadius: loginBorderRadius),
                        child: Padding(
                          padding: EdgeInsets.only(left: 22.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              CommonText(
                                text: "Change Password",
                                color: primaryColor,
                                size: 26.sp,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    AuthTextField(
                                      minLength: 8,
                                      controller:
                                      controller.fpNewPassword,
                                      textInputType:
                                      TextInputType.visiblePassword,
                                      hintText: "Current Password",
                                      prefixIcon: Icons.lock,
                                      validationBuilder:
                                      ValidationBuilder().build(),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    AuthTextField(
                                      minLength: 8,
                                      controller: controller
                                          .fpConfirmNewPassword,
                                      textInputType:
                                      TextInputType.visiblePassword,
                                      hintText: "Confirm New Password",
                                      obscureText: true,
                                      prefixIcon: Icons.lock,
                                      validationBuilder: FieldValidator.equalTo(
                                          controller.fpNewPassword,
                                          message: "Password mismatch"),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),

                                    SizedBox(
                                      height: 42.h,
                                    ),
                                    Center(
                                      child: commonButton(
                                        text: "Update",
                                        textSize: 14.0,
                                        width: 200.0.w,
                                        bgColor: primaryColor,
                                        onPressed: () {
                                          validateToChangePassword(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GetBuilder<EventoForgotController>(
                  id: "fpConfirmOtp",
                  builder: (controller) {
                    debugPrint(
                        "Value of updatePasswordCircular is ${controller.fpConfirmOtp}");
                    return controller.fpConfirmOtp
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
      ),
    );
  }

  void validateToChangePassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      controller.fpConfirmOtpF();
      controller.fpUpdatePassword();
      FocusScope.of(context).unfocus();
    }
  }
}
