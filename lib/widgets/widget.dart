import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  final double? height;

  const CommonAppBar({Key? key, this.title, this.height}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? 100);

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreferredSize(
        preferredSize: Size.fromHeight(height ?? 80.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: AppBar(
            elevation: 0.0,
            centerTitle: true,
            leading: const Icon(
              Icons.keyboard_arrow_left,
              color: primaryTextColor,
            ),
            backgroundColor: whiteColor,
            title: CommonText(
              text: title,
              color: primaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CommonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign isCenter;
  final double? height;

  const CommonText(
      {Key? key,
      this.text,
      this.weight,
      this.size,
      this.color,
      this.isCenter = TextAlign.left,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontFamily: "poppins",
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.w600,
      ),
      textAlign: isCenter,
    );
  }
}

class DataTextFields extends StatelessWidget {
  final String? hintText, errorText;
  final int? minLength, maxLength;
  final double? hintSize;
  final bool ismaxLength, obscureText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final validationBuilder;

  const DataTextFields(
      {Key? key,
      this.hintText,
      this.errorText,
      this.controller,
      this.minLength,
      this.ismaxLength = false,
      this.textInputType,
      this.maxLength,
      this.obscureText = false,
      this.hintSize, this.inputFormatter, this.validationBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0.h,
      width: MediaQuery.of(context).size.width * 0.87,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.name,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(fontSize: hintSize ?? 12),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 1.0),
          ),
        ),
        inputFormatters: inputFormatter,
        validator: validationBuilder??ValidationBuilder().minLength(minLength??3).build(),
      ),
    );
  }
}

Widget commonButton(
        {text,
        height,
        width,
        color,
        textSize,
        textColor,
        onPressed,
        borderRadius}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
            Size(width ?? 250.w, height ?? 48.h)),
        backgroundColor:
            MaterialStateProperty.all<Color>(color ?? secondaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 24),
          ),
        ),
      ),
      child: CommonText(
        text: text,
        size: textSize ?? 20.sp,
        weight: FontWeight.w500,
        color: whiteColor,
      ),
    );

class CommonProfileDisplayWidget extends StatelessWidget {
  final String? url;
  final Color? color;
  final double? height, width;
  final bool isPadded;

  const CommonProfileDisplayWidget(
      {Key? key,
      this.url,
      this.color,
      this.height = 40,
      this.width = 40,
      this.isPadded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height! + 4,
      width: width! + 4,
      padding: isPadded ? const EdgeInsets.all(5) : const EdgeInsets.all(0.0),
      decoration:
          BoxDecoration(color: color ?? secondaryColor, shape: BoxShape.circle),
      child: ClipOval(
        child: Image.network(
          url ?? sampleProfileImageUrl,
          height: height,
          width: width,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: Image.asset(
                "assets/gifs/loadingGiphy.gif",
                height: height ?? 40.h,
                width: width ?? 40.w,
              ),
            );
          },
        ),
      ),
    );
  }
}

class HoveringUtilityWidget extends StatelessWidget {
  final double? height, width;
  final IconData? icon;
  final Color? borderColor, iconColor, containerColor;
  final double? iconSize;
  final bool isShadow;
  final void Function(BuildContext context)? onPressed;

  const HoveringUtilityWidget(
      {Key? key,
      this.height,
      this.width,
      this.icon,
      this.borderColor,
      this.iconColor,
      this.containerColor,
      this.iconSize,
      this.isShadow = false,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 51.h,
      width: width ?? 51.w,
      decoration: BoxDecoration(
        color: containerColor ?? whiteColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: isShadow ? Colors.grey.shade400 : Colors.transparent,
            offset: const Offset(
              1.2,
              0.0,
            ),
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
        border:
            Border.all(color: borderColor ?? primaryTextColor, width: 0.3.w),
      ),
      child: Center(
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () async => onPressed!(context),
          icon: Icon(
            icon,
            color: iconColor ?? primaryColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}

class ShowSimpleDialogue extends StatelessWidget {
  final String? title, mdFileName;

  const ShowSimpleDialogue({Key? key, this.title, this.mdFileName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          CommonText(
            text: title,
            size: 16.3,
            color: primaryTextColor,
          ),
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 150)).then(
                  (value) => rootBundle
                      .loadString('assets/policies/privacy_policy.md')),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return Markdown(
                    data: snapShot.data.toString(),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Close"))
        ],
      ),
    );
  }
}

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

class BuildReviewWidget extends StatelessWidget {
  final String? userText, contentText, url, rating;

  const BuildReviewWidget(
      {Key? key, this.userText, this.contentText, this.rating, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: primaryBgColor),
      child: Column(
        children: [
          ListTile(
            leading: CommonProfileDisplayWidget(
              url: url,
              height: 65,
              width: 52,
              color: Colors.transparent,
            ),
            title: CommonText(
              text: userText ?? '',
              size: 12,
            ),
            subtitle: CommonText(
              text: rating,
              color: primaryTextColor,
              size: 11,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CommonText(
            text: contentText,
            size: 11,
          )
        ],
      ),
    );
  }
}

commonSnackBar(
    {String? title, String? message, Color? color, Color? bgColor}) async {
  Get.snackbar(
    title ?? '',
    message ?? '',
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    snackPosition: SnackPosition.BOTTOM,
    colorText: color ?? const Color(0xFF58BC8A),
    backgroundColor: bgColor ?? whiteColor,
  );
}
