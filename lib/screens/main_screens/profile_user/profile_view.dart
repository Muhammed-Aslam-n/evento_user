import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/profile/profileWholeController.dart';
import 'package:evento_user/controller/profile/profile_updation/password_%20updating_controller.dart';
import 'package:evento_user/controller/profile/profile_updation/updateProfileController.dart';
import 'package:evento_user/screens/main_screens/home/home_page/category/event_details.dart';
import 'package:evento_user/screens/main_screens/profile_user/profile_update.dart';
import 'package:evento_user/widgets/data_textfield.dart';
import 'package:evento_user/widgets/snackbar.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: whiteColor,
              actions: [
                IconButton(
                  onPressed: () {
                    debugPrint("UpdateProfileIcon Clicked");
                    ShowWholeProfileDetailsController
                        .showWholeProfileDetailsController
                        .selectNewProfile();
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,shape: BoxShape.circle
                    ),
                    child: Image.asset(
                        "assets/images/newImages/userUpdateProfileIcon.png",fit: BoxFit.fitWidth,),
                  ),
                ),
                profileMenuButton(),
              ],
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: GetBuilder<ShowWholeProfileDetailsController>(
                  builder: (controller) {
                    return controller.userProfilePicture != null
                        ? Image.network(
                            controller.userProfilePicture ??
                                sampleProfileImageUrl2,
                            fit: BoxFit.fitWidth,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: Image.asset(
                                  "assets/gifs/loadingGiphy.gif",
                                  height: 100.h,
                                  width: 100.w,
                                ),
                              );
                            },
                          )
                        : Image.asset(
                            "assets/images/newImages/userNoProfileIcon.png",
                            fit: BoxFit.fitHeight,
                          );
                  },
                ),
              ),
              // bottom: PreferredSizeWidget(),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GetBuilder<ShowWholeProfileDetailsController>(
                      builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: CommonText(
                            text: controller.userName,
                            color: primaryTextColor,
                            size: 24.0.sp,
                          ),
                        ),
                        Center(
                          child: CommonText(
                            text: controller.email,
                            color: primaryTextColorr.withOpacity(0.7),
                            size: 14.0.sp,
                          ),
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Center(
                          child: CommonText(
                            text: controller.phoneNumber,
                            color: primaryTextColorr.withOpacity(0.7),
                            size: 15.0.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CommonText(
                          text: "Your Events",
                          color: primaryTextColor,
                          size: 15.0.sp,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        buildEventCards(),
                        SizedBox(
                          height: 30.h,
                        ),
                        buildEventCards(),
                        SizedBox(
                          height: 30.h,
                        ),
                        buildEventCards(),
                        SizedBox(
                          height: 30.h,
                        ),
                        buildEventCards(),
                        SizedBox(
                          height: 30.h,
                        ),
                        buildEventCards(),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildEventCards() {
    return GestureDetector(
      onTap: () => Get.to(() => const EventDetails()),
      child: Container(
        width: 200.w,
        height: 60.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF615D96),
        ),
        child: Center(
          child: CommonText(
            text: "Eva's B'day",
            color: whiteColor,
            size: 15.0.sp,
          ),
        ),
      ),
    );
  }

  profileMenuButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: whiteColor,
        ),
        color: primaryTextColor,
        offset: const Offset(10, -10),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                Get.back();
                UpdateProfileController.updateProfileController.showFetchedProfileDetails();
                Get.to(() => UpdateProfile());
              },
              child: const CommonText(
                text: "Update Profile",
                color: whiteColor,
                size: 12,
                weight: FontWeight.w400,
              ),
            ),
            value: 1,
          ),
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                Get.back();
                buildUpdatePasswordBSheet(context);
              },
              child: const CommonText(
                text: "Change Password",
                color: whiteColor,
                size: 12,
                weight: FontWeight.w400,
              ),
            ),
            value: 1,
          ),
        ],
      ),
    );
  }

  buildUpdatePasswordBSheet(context) {
    final upPassController = UpdatePasswordController.updatePasswordController;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: dayContainerRadius, topRight: dayContainerRadius)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  const CommonText(
                    text: "Update Password",
                    size: 18,
                    color: primaryTextColor,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DataTextFields(
                    hintText: "Current Password",
                    controller: upPassController.currentPassword,
                    minLength: 5,
                    maxLength: 8,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DataTextFields(
                    hintText: "New Password",
                    controller: upPassController.newPasswordController,
                    minLength: 5,
                    maxLength: 8,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        UpdatePasswordController.updatePasswordController
                            .updatePassword();
                        Get.back();
                        FocusScope.of(context).unfocus();
                      }

                      // Get.back();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: primaryTextColor),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
    );
  }
}
