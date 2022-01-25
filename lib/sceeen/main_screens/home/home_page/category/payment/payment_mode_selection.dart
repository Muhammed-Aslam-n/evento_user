import 'package:cool_alert/cool_alert.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("This is Selected Payment Page"),
            ),
            SizedBox(
              height: 30.h,
            ),
            commonButton(
              text: "Checkout",
              textSize: 14.2,
              borderRadius: 12.0,
              height: 40.h,
              width: 110.w,
              onPressed: () {
                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    borderRadius: 12.0.r,
                    text: "Payment was Successful",
                    barrierDismissible: true,
                    backgroundColor: whiteColor,
                    animType: CoolAlertAnimType.slideInDown,
                    autoCloseDuration: const Duration(milliseconds: 2000),
                    lottieAsset: "assets/gifs/successLottie.json");
              },
            ),
          ],
        ),
      ),
    );
  }
}
