import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/sceeen/main_screens/home/home_page/category/event_details.dart';
import 'package:evento_user/sceeen/main_screens/profile_user/profile_update.dart';
import 'package:evento_user/widgets/data_textfield.dart';
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
              actions: [
                profileMenuButton(),
              ],
              automaticallyImplyLeading: false,
              expandedHeight: 342,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  sampleProfileImageUrl2,
                  fit: BoxFit.fitWidth,
                ),
              ),
              // bottom: PreferredSizeWidget(),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CommonText(
                        text: "Amanda",
                        color: const Color(0xFF90A4B4),
                        size: 24.0.sp,
                      ),
                      CommonText(
                        text: "Josu",
                        color: const Color(0xFF90A4B4),
                        size: 24.0.sp,
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      CommonText(
                        text: "Clinton HO",
                        color: const Color(0xFF4EB2D1),
                        size: 15.0.sp,
                      ),
                      CommonText(
                        text: "West home New York",
                        color: const Color(0xFF4EB2D1),
                        size: 15.0.sp,
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
                    ],
                  ),
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
      onTap: () => Get.to(()=>const EventDetails()),
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
          color: primaryTextColor,
        ),
        color: primaryTextColor,
        offset: const Offset(10, -10),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                Get.back();
                Get.to(() => const UpdateProfile());
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
                buildUpdatePasswordBSheet();
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

  buildUpdatePasswordBSheet() {
    EventoController.eventoController.clearUpdatePasswordControllers();
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: dayContainerRadius, topRight: dayContainerRadius)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  controller: EventoController
                      .eventoController.passwordEditingController,
                  minLength: 5,
                  maxLength: 8,
                ),
                SizedBox(
                  height: 5.h,
                ),
                DataTextFields(
                  hintText: "New Password",
                  controller:
                      EventoController.eventoController.newPasswordController,
                  minLength: 5,
                  maxLength: 8,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                      EventoController.eventoController.commonSnackBar(
                          "Password", "Password Updated Successfully");
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: primaryTextColor),
                    )),
                SizedBox(
                  height: 80.h,
                ),
              ],
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
