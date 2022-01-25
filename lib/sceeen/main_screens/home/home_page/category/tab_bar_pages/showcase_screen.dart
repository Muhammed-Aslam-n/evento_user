import 'package:carousel_slider/carousel_slider.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ShowcaseScreen extends StatelessWidget {
  final List<String> details;
  const ShowcaseScreen({Key? key,required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            buildCarousalSlider(),
            SizedBox(height: 20.h,),
            const ProfileDetailCardWidget(
              headText: "Profile Description",
              widgetItems: [
                CommonText(text: dummyText,),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ProfileDetailCardWidget(
              headText: "Address",
              widgetItems: [
                CommonText(
                  text: details[0],
                ),
                CommonText(
                  text: details[1],
                ),
                CommonText(
                  text: details[2],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),

          ],
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
