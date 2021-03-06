import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/authorization/loginController.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/screens/authentication_screens/forgot_password/forgot_password_section1.dart';
import 'package:evento_user/screens/authentication_screens/register/register_section_one.dart';
import 'package:evento_user/widgets/auth_fields.dart';
import 'package:evento_user/widgets/auth_platform_widget.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class LoginHome extends StatelessWidget {
  LoginHome({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginController = LoginController.loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: loginBgColor,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: GestureDetector(
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
                                Center(
                                  child: CommonText(
                                    text: "Welcome back !",
                                    color: primaryColor,
                                    size: 26.sp,
                                  ),
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
                                        controller:
                                        loginController.emailEditingController,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        hintText: "Email",
                                        prefixIcon: Icons.email,
                                        validationBuilder:
                                            ValidationBuilder().email().build(),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      AuthTextField(
                                        minLength: 8,
                                        controller: loginController
                                            .passwordEditingController,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        hintText: "Password",
                                        obscureText: true,
                                        prefixIcon: Icons.lock,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 25.w),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(() =>
                                                ForgotPasswordSectionOne());
                                            },
                                            child: CommonText(
                                              text: "Forgot password?",
                                              size: 11.sp,
                                              weight: FontWeight.w400,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 42.h,
                                      ),
                                      Center(
                                        child: commonButton(
                                          text: "Login",
                                          textSize: 14.0,
                                          width: 200.0.w,
                                          bgColor: primaryColor,
                                          onPressed: () {
                                            validateToLogin(context);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0.h,
                                      ),
                                      const Center(
                                        child: CommonText(
                                          text: "Or login with",
                                          color: placeHolderColor,
                                          size: 11,
                                          weight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0.h,
                                      ),
                                      Center(
                                        child: LoginOrSigningPlatform(
                                          height: 40,
                                          width: 50,
                                          onTap: () {
                                            debugPrint(
                                                "Login with Google Clicked");
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0.h,
                                      ),
                                      Center(
                                        child: Wrap(
                                          children: [
                                            CommonText(
                                              text: "Don't have an account?",
                                              size: 11.sp,
                                              weight: FontWeight.w400,
                                              color: placeHolderColor,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                navigateToSignup(context);
                                              },
                                              child: CommonText(
                                                text: "\t\tSignUp",
                                                size: 11.sp,
                                                weight: FontWeight.w400,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
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
                  GetBuilder<EventoController>(
                    id: "loginCircularBar",
                    builder: (controller) {
                      debugPrint(
                          "Value of Progress in LoginScreen is ${loginController.loginCircBar}");
                      return loginController.loginCircBar
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
      ),
    );
  }

  void validateToLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // loginController.loginCircularBar();
      loginController.loginVendor(context);
      FocusScope.of(context).unfocus();
    }
  }

  void navigateToSignup(BuildContext context) {
    Get.to(() => RegisterSectionOne());
    FocusScope.of(context).unfocus();
  }
}
