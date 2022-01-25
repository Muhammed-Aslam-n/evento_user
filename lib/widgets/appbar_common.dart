import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/widgets/text_common.dart';
import 'package:flutter/material.dart';

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