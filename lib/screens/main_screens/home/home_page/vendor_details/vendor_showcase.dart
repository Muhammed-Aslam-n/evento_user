import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/screens/main_screens/home/home_page/category/tab_bar_pages/review_screen.dart';
import 'package:evento_user/screens/main_screens/home/home_page/category/tab_bar_pages/showcase_screen.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/profiledisplay_widget.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'book_appointment.dart';

class VendorShowcase extends StatelessWidget {
  const VendorShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              CommonProfileDisplayWidget(
                width: 151.w,
                height: 148.h,
                url: sampleProfileImageUrl2,
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonText(
                text: EventoController.eventoController.selectedVendorPerson,
                size: 23.sp,
                color: primaryTextColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonText(
                    text:
                        "\$${EventoController.eventoController.selectedVendorAmount}",
                    color: Colors.red,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0xFF52B352),
                    ),
                    child: Text(
                      "${EventoController.eventoController.selectedVendorRating}	☆",
                      style: const TextStyle(fontSize: 9, color: whiteColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              commonButton(
                width: 206.w,
                height: 44.h,
                color: const Color(0xFF569DD0),
                text: "Book Appointment",
                textSize: 12.0,
                onPressed: () {
                  Get.to(()=>const BookAppointment());
                  debugPrint("Appointment Booked");
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TabBar(
                        indicator: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Color(0xFFDFD6F3)),
                        indicatorColor: Colors.transparent,
                        labelColor: primaryTextColor,
                        unselectedLabelColor: placeHolderColor,
                        tabs: [
                          buildTabBarHeading(text: "Profile"),
                          buildTabBarHeading(text: "Reviews"),
                        ],
                      ),
                    ),
                    Container(
                      height: 1000.h, //height of TabBarView
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(
                        children: <Widget>[
                          ShowcaseScreen(
                            details: [
                              EventoController
                                      .eventoController.selectedVendorPerson ??
                                  '',
                              "Vagon Villa - New York",
                              "New York 10253"
                            ],
                          ),
                          const ReviewsScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTabBarHeading({String? text}) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: CommonText(
            text: text ?? '',
            size: 14.6,
            weight: FontWeight.w500,
          ),
        ),
      );
}
