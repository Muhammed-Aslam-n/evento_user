import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EventNameCreatingController extends GetxController{

  static EventNameCreatingController eNameController = Get.find();

  TextEditingController createdEventName = TextEditingController();
  TextEditingController createdEventDate = TextEditingController();


  @override
  void dispose() {
    createdEventName.dispose();
    createdEventDate.dispose();
    super.dispose();
  }
}