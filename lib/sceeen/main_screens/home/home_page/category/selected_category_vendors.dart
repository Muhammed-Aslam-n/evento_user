import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/sceeen/main_screens/home/home_page/vendor_details/vendor_showcase.dart';
import 'package:evento_user/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectedCategoryVendorList extends StatelessWidget {
  final String? heading;

  const SelectedCategoryVendorList({Key? key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventoController.eventoController.searchQueryController.clear();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CommonText(
                  text: heading,
                  size: 24.0.sp,
                  color: primaryTextColor,
                  weight: FontWeight.w400,
                ),
                SizedBox(
                  height: 30.h,
                ),
                buildSearchBar(),
                SizedBox(
                  height: 20.h,
                ),
                buildVendorLists(),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildSearchBar() {
    return Container(
      height: 43.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryTextColor)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                controller:
                    EventoController.eventoController.searchQueryController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  // contentPadding: EdgeInsets.only(left: ),
                  hintText: "\t\t\tsearch",
                  hintStyle: TextStyle(color: placeHolderColor),
                ),
                onChanged: (queryAtInstance) {
                  // EventoController.eventoController.searchQueryController.text =
                  //     queryAtInstance;
                  debugPrint(queryAtInstance);
                },
              ),
            ),
          ),
          Container(
            width: 50.w,
            decoration: const BoxDecoration(
              color: primaryTextColor,
              borderRadius: BorderRadius.only(
                  topRight: searchIconCRadius, bottomRight: searchIconCRadius),
            ),
            child: const Center(
              child: Icon(
                Icons.search,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildVendorLists() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (ctx, index) {
        return SizedBox(
        height: 86.h,
        width: 150.w,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: GestureDetector(
                onTap: (){
                  EventoController.eventoController.selectedVendorPerson = sampleName[index];
                  EventoController.eventoController.selectedVendorRating = sampleRating[index];
                  EventoController.eventoController.selectedVendorAmount = sampleAmounts[index];
                  Get.to(()=>const VendorShowcase());
                },
                child: Container(
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.5,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],),
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
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: const Color(0xFF52B352),
                          ),
                          child: Text(
                            "${sampleRating[index]}	☆",
                            style: const TextStyle(fontSize: 9, color: whiteColor),
                          ),
                        ),
                        Text(
                          sampleAmounts[index],
                          style:
                              const TextStyle(fontSize: 18, color: warningColors),
                        ),
                      ],
                    ),
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
    );
  }
}
