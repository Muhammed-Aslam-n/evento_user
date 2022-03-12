import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api_helper/services/event_creation/create_event_api.dart';

class EventNameCreatingController extends GetxController{

  static EventNameCreatingController eNameController = Get.find();

  TextEditingController createdEventName = TextEditingController();
  String? createdEventDate;

  createNewEvent(){
    String name = createdEventName.text;
    UserEventHandlingAPI().createNewEventApiFn(eventName: name,date: createdEventDate);
  }




  @override
  void dispose() {
    createdEventName.dispose();
    super.dispose();
  }
}