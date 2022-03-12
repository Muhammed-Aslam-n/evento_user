import 'package:backdrop/backdrop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/controller/home/homeController.dart';
import 'package:evento_user/controller/user_map_marking/user_map_controller.dart';
import 'package:evento_user/widgets/profiledisplay_widget.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'homewidgets.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: primaryColor,
        actions: [
          TextButton(
            onPressed: () {
              UserPlaceMarking.userPlaceMarking.openMapPage();
            },
            child: const Text(
              "OPEN MAP",
              style: TextStyle(color: Colors.redAccent),
            ),
          )
        ],
      ),
      backLayer: SizedBox(
        width: double.maxFinite,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: const BackdropScaffoldItems()),
      ),
      frontLayer: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31.h,
              ),
              Align(
                alignment: Alignment.center,
                child: GetBuilder<HomeController>(builder: (controller) {
                  return Container(
                    height: 85.h,
                    width: 326.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFFEDEDED),
                    ),
                    child: ListTile(
                      title: const CommonText(
                        text: "Hello",
                        color: Color(0xFFC1C1B7),
                        weight: FontWeight.w400,
                      ),
                      subtitle: CommonText(
                        text: controller.userName,
                        weight: FontWeight.w400,
                      ),
                      trailing: CommonProfileDisplayWidget(
                        url: controller.userProfileURL,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 30.h,
              ),
              buildCarousalSlider(),
              SizedBox(
                height: 20.h,
              ),
              const CommonText(
                text: "Our Services",
                color: primaryTextColor,
                size: 17.0,
              ),
              SizedBox(
                height: 20.h,
              ),
              CategoryDisplayWidget(),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  buildCarousalSlider() => CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
          autoPlay: true,
        ),
        items: EventoController.eventoController.carousalImageList
            .map(
              (imageUrl) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList(),
      );
}
