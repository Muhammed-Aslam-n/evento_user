import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/event_details_controller/eventcreating_controller.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/screens/main_screens/feedback/feedback_user.dart';
import 'package:evento_user/widgets/button.dart';
import 'package:evento_user/widgets/data_textfield.dart';
import 'package:evento_user/widgets/simpledialogue.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'category/fillout_event_details.dart';

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
            EventoController.eventoController.logoutVendor();
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
          onTap: () => createEvent(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(imageUrl),
              ),
            ),
            child: Center(
              child: Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 18,
                  color: whiteColor,
                  fontWeight: FontWeight.w600,
                  shadows: shadow,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  selectCreatedEvent() {
    final eventCreatingController = EventNameCreatingController.eNameController;
    return Get.bottomSheet(
      Container(
        height: 550.h,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: searchIconCRadius,
            topRight: searchIconCRadius,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const Align(
                alignment: Alignment.center,
                child: CommonText(
                  text: "Select Event",
                  color: primaryColor,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.center,
                child: commonButton(
                  text: "Continue",
                  onPressed: () {
                    Get.to(() => FilloutEventDetails());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
    );
  }

  createEvent(context) {
    final eventCreatingController = EventNameCreatingController.eNameController;
    DateTime selectedDate = DateTime.now();
    return Get.bottomSheet(
      Container(
        height: 550.h,
        // width: double.maxFinite,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: searchIconCRadius,
            topRight: searchIconCRadius,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const Align(
                alignment: Alignment.center,
                child: CommonText(
                  text: "Create an Event",
                  color: primaryColor,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const CommonText(
                text: "Event",
                color: primaryColor,
                size: 15.2,
              ),
              DataTextFields(
                controller: eventCreatingController.createdEventName,
                hintText: "Name the Event",
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CommonText(text: "Pick Date"),
                  IconButton(
                    onPressed: () async {
                      selectedDate =
                          await showDatePickerFn(context, selectedDate);
                      debugPrint("Selected Date is $selectedDate");
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Align(
                alignment: Alignment.center,
                child: commonButton(
                  text: "Continue",
                  onPressed: () {
                    var myFormat = DateFormat('yyyy-MM-dd');
                    var dateOnly = myFormat.format(selectedDate);
                    debugPrint("Splitted Date is $dateOnly");
                    EventNameCreatingController.eNameController.createdEventDate = "2022-02-15";
                    EventNameCreatingController.eNameController.createNewEvent();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
    );
  }

  showDatePickerFn(BuildContext context, selectedDate) {
    debugPrint("Clicked Calender Pick");
    return showDatePicker(
      firstDate: DateTime(2022, 2, 1),
      lastDate: DateTime(2022, 2, 29),
      initialDate: selectedDate,
      context: context,
    );
  }
}
