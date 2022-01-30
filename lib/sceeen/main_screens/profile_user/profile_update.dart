import 'package:cool_alert/cool_alert.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/profile_updation/updateProfile.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/data_textfield.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({Key? key}) : super(key: key);
  
  final updateProfileCntrlr = UpdateProfileController.updateProfileController;

  @override
  Widget build(BuildContext context) {
    // updateProfileCntrlr.clearUsernameUpdatingControllers();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                minLength: 9,
                controller:
                    updateProfileCntrlr.nameController,
                textInputType: TextInputType.name,
                hintText: "Your name",
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonText(
                text: "Place",
                size: 16.sp,
                color: primaryColor,
              ),
              DataTextFields(
                minLength: 9,
                controller: updateProfileCntrlr.placeController,
                textInputType: TextInputType.name,
                hintText: "Your place",
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonText(
                text: "City",
                size: 16.sp,
                color: primaryColor,
              ),
              DataTextFields(
                minLength: 9,
                controller:
                    updateProfileCntrlr.cityEditingController,
                textInputType: TextInputType.name,
                hintText: "Your city",
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonText(
                text: "District",
                size: 16.sp,
                color: primaryColor,
              ),
              DataTextFields(
                minLength: 9,
                controller:
                    updateProfileCntrlr.districtController,
                textInputType: TextInputType.name,
                hintText: "Your district",
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonText(
                text: "State",
                size: 16.sp,
                color: primaryColor,
              ),
              DataTextFields(
                minLength: 9,
                controller:
                    updateProfileCntrlr.userStateController,
                textInputType: TextInputType.name,
                hintText: "Your state",
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
                    confirmUser(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void confirmUser(BuildContext context) {
    CoolAlert.show(
      barrierDismissible: true,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          CommonText(
            text: "Password",
            size: 14.sp,
            color: primaryColor,
          ),
          DataTextFields(
            minLength: 9,
            controller:
                updateProfileCntrlr.passwordController,
            textInputType: TextInputType.name,
            hintText: "Your password",
          ),
          SizedBox(
            height: 20.h,
          ),
          CommonText(
            text: "Confirm Password",
            size: 14.sp,
            color: primaryColor,
          ),
          DataTextFields(
            minLength: 9,
            controller: updateProfileCntrlr.userStateController,
            textInputType: TextInputType.name,
            hintText: "Your password",
          ),
        ],
      ),
      title: "Confirm your password",
      context: context,
      type: CoolAlertType.confirm,
    );
  }
}
