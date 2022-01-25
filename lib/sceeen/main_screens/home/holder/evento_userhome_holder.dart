import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/controller/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePageHolder extends StatelessWidget {
  const HomePageHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GetBuilder<EventoController>(
        id: 'btmNavigation',
        builder: (controller)=> controller.mainScreens[controller.initialIndex??0],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: primaryBgColor,
        buttonBackgroundColor: primaryBgColor,
        index: EventoController.eventoController.initialIndex??0,
        height: 60.h,
        animationDuration: const Duration(milliseconds: 300),
        items: EventoController.eventoController.navigationBarIcons,
        onTap: (index)=>EventoController.eventoController.changeInitialIndex(index),
      ),
    );
  }
}
