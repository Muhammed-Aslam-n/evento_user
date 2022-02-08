import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/screens/main_screens/home/home_page/category/payment/paymethod_selection.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);

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
              CommonText(
                text: "Eva's B'day",
                size: 22.0.sp,
                color: primaryTextColor,
              ),
              SizedBox(
                height: 30.h,
              ),
              buildVendorDetails(),
              SizedBox(
                height: 30.h,
              ),
              commonButton(
                color: primaryTextColor,
                onPressed: (){
                  Get.to(()=> const PaymentMethodSelection());
                },
                text: "Pay",
                textSize: 14.2,
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  buildVendorDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (ctx, index) {
          return SizedBox(
            height: 86.h,
            width: 150.w,
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1.5,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        tileColor: const Color(0xFFF8Fcda),
                        shape: const RoundedRectangleBorder(),
                        leading: SizedBox(
                          width: 30.w,
                        ),
                        title: CommonText(
                          text: sampleName[index],
                          color: primaryTextColor,
                          size: 17.0.sp,
                          weight: FontWeight.w400,
                        ),
                        subtitle: CommonText(
                            text: samplePlaces[index],
                            color: paymentTextColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                        trailing: CommonText(text: "\$ ${sampleAmounts[index]}",color: warningColors,)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 63.h,
                  width: 60.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      searchImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (ctx, index) => SizedBox(
          height: 10.h,
        ),
      ),
    );
  }
}
