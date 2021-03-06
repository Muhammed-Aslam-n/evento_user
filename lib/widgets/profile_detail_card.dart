import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetailCardWidget extends StatelessWidget {
  final String? headText;
  final double? headSize, width;
  final List<Widget>? widgetItems;

  const ProfileDetailCardWidget(
      {Key? key, this.headText, this.headSize, this.widgetItems, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            CommonText(
              text: headText ?? '',
              color: secondaryColor,
              size: headSize ?? 17,
              weight: FontWeight.w500,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgetItems!.map((widgets) => widgets).toList(),
              ),
            ),
            SizedBox(
              height: 0.h,
            ),
          ],
        ),
      ),
    );
  }
}