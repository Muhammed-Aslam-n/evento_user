import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:evento_user/sceeen/main_screens/home/home_page/category/payment/payment_mode_selection.dart';
import 'package:evento_user/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentMethodSelection extends StatelessWidget {
  const PaymentMethodSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: "Payment Methods",
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 232.h,
              width: 321.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: paymentCardColor),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  paymentListTile(
                    iconImage:
                        "assets/images/paymentImages/paymentiIcons/CreditCardIcon.png",
                    title: "Credit Card",
                    radioValue: 1,
                  ),
                  divider,
                  paymentListTile(
                    iconImage:
                        "assets/images/paymentImages/paymentiIcons/PayPalImage.png",
                    title: "Paypal",
                    radioValue: 2,
                  ),
                  divider,
                  paymentListTile(
                    iconImage:
                        "assets/images/paymentImages/paymentiIcons/razorPayImage.png",
                    title: "Razor Pay",
                    radioValue: 3,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          commonButton(
              text: "Continue",
              onPressed: () => Get.to(() => const PaymentMethodView())),
        ],
      ),
    );
  }

  paymentListTile({iconImage, title, trailing, int radioValue = 1}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          leading: Image.asset(
            iconImage,
            width: 38.w,
            height: 38.h,
          ),
          title: CommonText(
            text: title,
          ),
          trailing: GetBuilder<EventoController>(
            id: 'subscriptionMethod',
            builder: (controller) {
              return Radio(
                value: radioValue,
                groupValue: controller.subscriptionMethodValue,
                onChanged: (value) {
                  controller.changeSubscriptionMethod(value ?? 1);
                  debugPrint(value.toString());
                },
                activeColor: Colors.green,
              );
            },
          ),
        ),
      );
}
