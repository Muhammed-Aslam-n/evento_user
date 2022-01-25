import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/sceeen/main_screens/home/holder/evento_userhome_holder.dart';
import 'package:evento_user/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetupProfile extends StatelessWidget {
  const SetupProfile({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: loginBgColor,
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: "Setup Profile",
                        color: primaryColor,
                        size: 22.sp,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    SizedBox(
                      height: 140.h,
                      width: 130.w,
                      child: Stack(
                        children: [
                          CommonProfileDisplayWidget(
                            height: 130.h,
                            width: 130.w,
                            color: whiteColor,
                          ),
                          Positioned(
                            right: 15,
                            bottom: 10,
                            child: HoveringUtilityWidget(
                              icon: Icons.edit,
                              height: 30.h,
                              width: 30.w,
                              iconSize: 20,
                              onPressed: (context) {
                                debugPrint(
                                    "Vendor profile picture setting button clicked");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                              child: CommonText(
                                text: "Your name",
                                size: 15.sp,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            DataTextFields(
                              minLength: 3,
                              controller: EventoController
                                  .eventoController.userNameController,
                              textInputType: TextInputType.name,
                              hintText: "Username",
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "Place",
                                size: 15.sp,
                                color: primaryColor,
                              ),
                            ),
                            DataTextFields(
                              minLength: 3,
                              controller:
                              EventoController.eventoController.placeController,
                              textInputType: TextInputType.name,
                              hintText: "Your place",
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "City",
                                size: 15.sp,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            DataTextFields(
                              minLength: 3,
                              controller: EventoController
                                  .eventoController.cityEditingController,
                              textInputType: TextInputType.name,
                              hintText: "Your city",
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "District",
                                size: 15.sp,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            DataTextFields(
                              minLength: 3,
                              controller: EventoController
                                  .eventoController.districtController,
                              textInputType: TextInputType.name,
                              hintText: "Your district",
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 23.h,
                              child: CommonText(
                                text: "State",
                                size: 15.sp,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            DataTextFields(
                              minLength: 3,
                              controller: EventoController
                                  .eventoController.userStateController,
                              textInputType: TextInputType.name,
                              hintText: "Your state",
                              obscureText: false,
                            ),
                            Expanded(
                              child: Center(
                                child: commonButton(
                                  width: 210.w,
                                  height: 40.0.h,
                                  textSize: 14.0,
                                  text: "Finish",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Get.to(()=>const HomePageHolder());
                                    } else {
                                      debugPrint("EE Kappal Aadi Ulayilla Sir....");
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
