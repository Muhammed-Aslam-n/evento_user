import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EventDetailsFilloutController extends GetxController{

  static EventDetailsFilloutController eDetailsFillController = Get.find();

  TextEditingController placeController = TextEditingController();
  TextEditingController venueAddressController = TextEditingController();
  TextEditingController venueContact1Controller = TextEditingController();
  TextEditingController venueContact2Controller = TextEditingController();

}