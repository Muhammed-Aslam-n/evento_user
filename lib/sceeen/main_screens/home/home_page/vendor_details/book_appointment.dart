import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/sceeen/main_screens/home/home_page/category/fillout_event_details.dart';
import 'package:evento_user/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bookedDates = [];
    DateRangePickerController _dateRangePickerController =
        DateRangePickerController();
    return Scaffold(
      appBar: const CommonAppBar(
        title: "Book Appointment",
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
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
            color: primaryTextColor,
            size: 17.0,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: SizedBox(
              child: SfDateRangePicker(
                monthViewSettings: DateRangePickerMonthViewSettings(
                  blackoutDates: [
                    DateTime(2022, 1, 26),
                    DateTime(2022, 2, 23),
                    DateTime(2022, 1, 31),
                  ],
                  viewHeaderHeight: 20,
                ),
                monthCellStyle: const DateRangePickerMonthCellStyle(
                    blackoutDatesDecoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    blackoutDateTextStyle:
                        TextStyle(color: whiteColor, fontSize: 12)),
                todayHighlightColor: primaryTextColor,
                backgroundColor: primaryBgColor,
                initialSelectedDate: DateTime(2022, 2, 1),
                maxDate: DateTime(2022, 2, 28),
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.multiple,
                showActionButtons: true,
                controller: _dateRangePickerController,
                confirmText: "NEXT",
                selectionColor: const Color(0xFF52B352),
                onCancel: () {
                  _dateRangePickerController.selectedDates = null;
                },
                onSubmit: (selectedDates) async {
                  bookedDates.add({'Date': selectedDates});
                  debugPrint(bookedDates.toString());
                  buildBottomSheet();
                  debugPrint(selectedDates.toString());
                },
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDFD6F3)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: warningColors,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const CommonText(
                      text: "Unavailable days",
                      size: 12,
                      weight: FontWeight.w400,
                      color: warningColors,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildBottomSheet() {
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
                  )),
              SizedBox(
                height: 20.h,
              ),
              const CommonText(
                text: "Event",
                color: primaryColor,
                size: 15.2,
              ),
              DataTextFields(
                controller: EventoController.eventoController.createdEventName,
                hintText: "Name the Event",
              ),
              SizedBox(
                height: 20.h,
              ),
              const CommonText(
                text: "Date",
                color: primaryColor,
                size: 15.2,
              ),
              DataTextFields(
                controller: EventoController.eventoController.createdEventDate,
                hintText: "Date of the Event",
              ),
              SizedBox(
                height: 35.h,
              ),
              Align(
                alignment: Alignment.center,
                child: commonButton(
                  text: "Continue",
                  onPressed: () {
                    Get.to(() => const FilloutEventDetails());
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
}
