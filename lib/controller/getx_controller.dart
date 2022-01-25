import 'dart:io';

import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/sceeen/main_screens/chat/chat_user.dart';
import 'package:evento_user/sceeen/main_screens/home/home_page/home.dart';
import 'package:evento_user/sceeen/main_screens/profile_user/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventoController extends GetxController{
  static EventoController eventoController = Get.find();

  @override
  void onInit() async {
    prefs = await _prefs;
    prefs.clear();
    checkAppLaunched();

    super.onInit();
  }

  //--------------------------------------------------------------------------------
  // Section to check whether the user launching this Application for the first time or not

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  bool? isAppLaunched = false;

  setAppLaunched() async {
    await prefs.setBool(sharedPrefKey, true).then((value) {
      var k = prefs.getBool(sharedPrefKey);
      debugPrint("SharedPreference Collected${k.toString()}");
    });
  }

  checkAppLaunched() async {
    isAppLaunched = prefs.getBool(sharedPrefKey);
    debugPrint(
        "value from SharedPreference is ${isAppLaunched.toString()} You may be set clear() before this function poyi ath sheriyaakk");
  }

  // -----------------------------------------------------------------------------

  // Section to Handle all the User Login / Register  Authentication

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  // SignUp Section TextEditingControllers

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
  TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController userStateController = TextEditingController();

  String userSelectedProfession = 'Photography'.obs();



// Home BottomNavigation Items
  int? initialIndex = 0.obs();
  final navigationBarIcons = <Widget>[
    const Icon(
      Icons.home_filled,
      color: primaryTextColor,
    ),
    const Icon(
      Icons.chat_bubble_outline,
      color: primaryTextColor,
    ),
    const Icon(
      Icons.person,
      color: primaryTextColor,
    ),
  ];

  changeInitialIndex(index) {
    initialIndex = index;
    update(['btmNavigation']);
  }

  List mainScreens = [
    const UserHome(),
    const UserChat(),
    const UserProfile(),
  ];


  // Section handling Index page of User ( Home )

  final List<String> carousalImageList = [
    "assets/images/carouselImages/carousel1.jfif",
    "assets/images/carouselImages/carousel2.jfif",
    "assets/images/carouselImages/carousel1.jfif",
    "assets/images/carouselImages/carousel2.jfif",
    "assets/images/carouselImages/carousel1.jfif",
  ];

  final List<String> categoryImageList = [
    'assets/images/categoryImages/category1.png',
    'assets/images/categoryImages/category2.png',
    'assets/images/categoryImages/category3.jfif',
    'assets/images/categoryImages/category4.jfif',
    'assets/images/categoryImages/category5.jfif',
    'assets/images/categoryImages/category6.jfif',
  ] ;
  final professionList = [
    'Catering',
    'Photography',
    'Wedding Card',
    'Mehndi',
    'Make Up',
    'Decorators',
  ];


  // SelectedVendorPage PlaceHolders

  String? selectedCategoryName = ''.obs();


  TextEditingController searchQueryController = TextEditingController();

  String? selectedVendorPerson = ''.obs();
  String? selectedVendorAmount = ''.obs();
  String? selectedVendorRating = ''.obs();

  // Event Creating BottomSheet

  TextEditingController createdEventName = TextEditingController();
  TextEditingController createdEventDate = TextEditingController();

  // Event Place Details Holders
  TextEditingController venueNameController = TextEditingController();
  TextEditingController venueAddressController = TextEditingController();
  TextEditingController venueContact1Controller = TextEditingController();
  TextEditingController venueContact2Controller = TextEditingController();
  String? latitude,longitude;


  clearVenueDetailsController(){
    venueNameController.clear();
    venueAddressController.clear();
    venueContact1Controller.clear();
    venueContact2Controller.clear();
  }


  // User Payment Section

  int? subscriptionMethodValue;

  changeSubscriptionMethod(value) {
    subscriptionMethodValue = value;
    update(['subscriptionMethod']);
  }









  // ShowCase image View Section

  File? file = File('');

  List<dynamic> showCaseImages = <dynamic>[
    'assets/images/showCaseImage/ShowCase1.jfif',
    'assets/images/showCaseImage/ShowCase2.jfif',
    'assets/images/showCaseImage/ShowCase3.jfif',
    'assets/images/showCaseImage/ShowCase4.jfif',
    'assets/images/showCaseImage/ShowCase5.jfif',
    'assets/images/showCaseImage/ShowCase6.jfif',
  ].obs();

  pickImage({required int index,required file}) async {
    // XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // file = File(xfile!.path);
    showCaseImages.insert(index, file);
    update(['showCaseSection']);
  }

// User Profile Updating

  // User Username Updating

  TextEditingController currentUsernameController = TextEditingController().obs();
  TextEditingController newUsernameController = TextEditingController().obs();

  // User Password Updating
  TextEditingController newPasswordController = TextEditingController().obs();



  // Feedback Section

  TextEditingController feedbackController = TextEditingController().obs();

  clearFeedbackController(){
    feedbackController.clear();
  }








  commonSnackBar(title, message) {
    Get.snackbar(
      title,
      message,
      borderRadius: 12,
      isDismissible: true,
      backgroundColor: const Color(0xFFF8F8F8),
      colorText: greenColor,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      snackPosition: SnackPosition.BOTTOM,
    );
  }



  clearLoginControllers(){
    emailEditingController.clear();
    passwordEditingController.clear();
  }

  clearSignup2Controllers(){
    phoneNumberController.clear();
    emailEditingController.clear();
    passwordEditingController.clear();
    confirmPasswordEditingController.clear();
  }

  clearProfileControllers() {
    placeController.clear();
    cityEditingController.clear();
    districtController.clear();
    userStateController.clear();
  }

  clearUsernameUpdatingControllers() {
    userNameController.clear();
    newUsernameController.clear();
  }

  clearUpdatePasswordControllers() {
    passwordEditingController.clear();
    newPasswordController.clear();
  }
}