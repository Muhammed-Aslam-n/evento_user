import 'package:backdrop/backdrop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/sceeen/main_screens/home/home_page/homewidgets.dart';
import 'package:evento_user/widgets/profiledisplay_widget.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: primaryColor,
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
                child: Container(
                  height: 85.h,
                  width: 326.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFFEDEDED),
                  ),
                  child:  const ListTile(
                      title: CommonText(
                        text: "Hello",
                        color: Color(0xFFC1C1B7),
                        weight: FontWeight.w400,
                      ),
                      subtitle: CommonText(
                        text: "Lionel Messi",
                        weight: FontWeight.w400,
                      ),
                      trailing: CommonProfileDisplayWidget()),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              buildCarousalSlider(),
              SizedBox(
                height: 20.h,
              ),
              const CommonText(text: "Our Services",color: primaryTextColor,size: 17.0,),
              SizedBox(
                height: 20.h,
              ),
              const CategoryDisplayWidget(),
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
