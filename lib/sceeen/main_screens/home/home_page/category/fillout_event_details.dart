import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/event_details_controller/event_details_fillout_controller.dart';
import 'package:evento_user/sceeen/main_screens/home/home_page/category/event_details.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/data_textfield.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class FilloutEventDetails extends StatelessWidget {
  FilloutEventDetails({Key? key}) : super(key: key);

  final eController = EventDetailsFilloutController.eDetailsFillController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                const CommonText(text: "Event Details",color: primaryTextColor,size: 24,),
                SizedBox(
                  height: 20.h,
                ),
                CommonText(
                  text: "Venue Name",
                  size: 16.sp,
                  color: primaryColor,
                ),
                DataTextFields(
                  minLength: 9,
                  controller: eController.placeController,
                  textInputType: TextInputType.name,
                  hintText: "Name of venue",
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonText(
                  text: "Address",
                  size: 16.sp,
                  color: primaryColor,
                ),
                Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: primaryBgColor,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller:
                    eController.venueAddressController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 20, top: 30, right: 20, bottom: 60),
                        hintText: "Try to include landmarks,pin",
                        hintStyle:
                        TextStyle(color: Colors.black45, fontSize: 11)),
                    minLines: 1,
                    maxLines: 10,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonText(
                  text: "Contact Number 1",
                  size: 16.sp,
                  color: primaryColor,
                ),
                DataTextFields(
                  minLength: 9,
                  controller: eController.venueContact1Controller,
                  textInputType: TextInputType.name,
                  hintText: "Mobile number",
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonText(
                  text: "Contact Number 2",
                  size: 16.sp,
                  color: primaryColor,
                ),
                DataTextFields(
                  minLength: 9,
                  controller: eController.venueContact2Controller,
                  textInputType: TextInputType.name,
                  hintText: "Mobile number",
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonButton(
                      borderRadius: 5.0,
                      width: 100.w,
                      color: primaryColor,
                      onPressed: (){
                        debugPrint("Navigating to Map");
                      },
                      text: "Mark in Map",
                      textSize: 10.2
                    ),
                    commonButton(
                        borderRadius: 5.0,
                        width: 100.w,
                        color: primaryTextColor,
                        onPressed: (){
                          debugPrint("Navigating to PayPage");
                          Get.to(()=>const EventDetails());
                        },
                        text: "Next",
                        textSize: 10.2
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
