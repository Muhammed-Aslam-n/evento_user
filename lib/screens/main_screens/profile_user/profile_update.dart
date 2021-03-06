import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/profile/profile_updation/updateProfileController.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/data_textfield.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final updateProfileCntrlr = UpdateProfileController.updateProfileController;

  @override
  Widget build(BuildContext context) {
    // updateProfileCntrlr.clearUsernameUpdatingControllers();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<UpdateProfileController>(
            builder: (controller) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    const CommonText(
                      text: "Profile",
                      color: primaryTextColor,
                      size: 24,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CommonText(
                      text: "Name",
                      size: 16.sp,
                      color: primaryColor,
                    ),
                    DataTextFields(
                      minLength: 3,
                      controller:
                          updateProfileCntrlr.nameController,
                      textInputType: TextInputType.name,
                      hintText: "Your name",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CommonText(
                      text: "Email",
                      size: 16.sp,
                      color: primaryColor,
                    ),
                    DataTextFields(
                      minLength: 5,
                      controller: updateProfileCntrlr.emailEditingController,
                      textInputType: TextInputType.name,
                      hintText: "Your place",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CommonText(
                      text: "Phone number",
                      size: 16.sp,
                      color: primaryColor,
                    ),
                    DataTextFields(
                      minLength: 10,
                      controller:
                          updateProfileCntrlr.phoneNumberController,
                      textInputType: TextInputType.name,
                      hintText: "Your city",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: commonButton(
                        height: 60.h,
                        width: 100.w,
                        text: "Update",
                        textSize: 14.5,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            UpdateProfileController.updateProfileController.updateProfile();
                            FocusScope.of(context).unfocus();
                          }
                          },
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  // void confirmUser(BuildContext context) {
  //   CoolAlert.show(
  //     barrierDismissible: true,
  //     widget: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           height: 20.h,
  //         ),
  //         CommonText(
  //           text: "Password",
  //           size: 14.sp,
  //           color: primaryColor,
  //         ),
  //         DataTextFields(
  //           minLength: 9,
  //           controller:
  //               updateProfileCntrlr.passwordController,
  //           textInputType: TextInputType.name,
  //           hintText: "Your password",
  //         ),
  //         SizedBox(
  //           height: 20.h,
  //         ),
  //         CommonText(
  //           text: "Confirm Password",
  //           size: 14.sp,
  //           color: primaryColor,
  //         ),
  //         DataTextFields(
  //           minLength: 9,
  //           controller: updateProfileCntrlr.userStateController,
  //           textInputType: TextInputType.name,
  //           hintText: "Your password",
  //         ),
  //       ],
  //     ),
  //     title: "Confirm your password",
  //     context: context,
  //     type: CoolAlertType.confirm,
  //   );
  // }
}
