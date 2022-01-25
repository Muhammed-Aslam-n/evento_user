import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/sceeen/main_screens/feedback/feedback_user.dart';
import 'package:evento_user/sceeen/main_screens/home/home_page/category/selected_category_vendors.dart';
import 'package:evento_user/widgets/simpledialogue.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BackdropScaffoldItems extends StatelessWidget {
  const BackdropScaffoldItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Get.to(() => const UserFeedback());
          },
          child: const CommonText(
            text: "Feedback",
            color: whiteColor,
            size: 18,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ShowSimpleDialogue(
                  title: "Privacy Policy",
                  mdFileName: 'privacy_policy.md',
                );
              },
            );
          },
          child: const CommonText(
            text: "Privacy Policy",
            color: whiteColor,
            size: 18,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ShowSimpleDialogue(
                  title: "Terms and Conditions",
                  mdFileName: 'terms_conditions.md',
                );
              },
            );
          },
          child: const CommonText(
            text: "Terms and Conditions",
            color: whiteColor,
            size: 18,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextButton(
          onPressed: () {},
          child: const CommonText(
            text: "Rate App",
            color: whiteColor,
            size: 18,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextButton(
          onPressed: () {},
          child: const CommonText(
            text: "Share",
            color: whiteColor,
            size: 18,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextButton(
          onPressed: () {
            debugPrint("Logging Out...");
          },
          child: const CommonText(
            text: "Logout",
            color: whiteColor,
            size: 18,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

class CategoryDisplayWidget extends StatelessWidget {
  const CategoryDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 1.3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      itemCount: EventoController.eventoController.categoryImageList.length,
      itemBuilder: (context, index) {
        String? categoryName =
            EventoController.eventoController.professionList[index];
        String? imageUrl =
            EventoController.eventoController.categoryImageList[index];
        return GestureDetector(
          onTap: () {
            EventoController.eventoController.selectedCategoryName = categoryName;
            Get.to(() => SelectedCategoryVendorList(heading: categoryName,));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(imageUrl),
              ),
            ),
            child: Center(
              child:
              Text(categoryName,style: const TextStyle(
                fontSize: 18,
                color: whiteColor,
                fontWeight: FontWeight.w600,
                shadows: shadow
              ),)
            ),
          ),
        );
      },
    );
  }
}

