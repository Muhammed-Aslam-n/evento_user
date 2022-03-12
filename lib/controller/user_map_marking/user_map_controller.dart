import 'package:cool_alert/cool_alert.dart';
import 'package:evento_user/constants/colors.dart';
import 'package:evento_user/screens/main_screens/chat/chat_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserPlaceMarking {
  static UserPlaceMarking userPlaceMarking = Get.find();
  static const secureStorage = FlutterSecureStorage();
  TextEditingController mapSearchingController = TextEditingController();
  double latitude=0;
  double longitude=0;
  saveLatAndLong(LatLng latLong) async {
    latitude = latLong.latitude;
    longitude = latLong.longitude;
  }

  openMapPage() {
    Get.to(() => const OpenMapScreen());
  }
}

class OpenMapScreen extends StatefulWidget {
  const OpenMapScreen({Key? key}) : super(key: key);

  @override
  _OpenMapScreenState createState() => _OpenMapScreenState();
}

class _OpenMapScreenState extends State<OpenMapScreen> {
  final controller = UserPlaceMarking.userPlaceMarking;

  final Set<Marker> _markers = {};
  var latLong;
  int count = 1;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        const Marker(
            markerId: MarkerId('m1'), position: LatLng(11.258753, 75.780411)),
      );
    });
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(11.258753, 75.780411),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              markers: _markers,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: _onMapCreated,
              onTap: (latlong) {
                latLong = latlong;
                debugPrint("LatLong is $latLong");
                setState(
                  () {
                    _markers.add(
                      Marker(markerId: MarkerId('$count'), position: latLong),
                    );
                  },
                );
              },
            ),
            Container(
              height: 60.h,
              width: MediaQuery.of(context).size.width - 50.w,
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.r),
                color: primaryBgColor.withOpacity(0.5),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 25.w,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller.mapSearchingController,
                      decoration: const InputDecoration(
                        enabled: false,
                        hintText: "Search by name",
                        border: InputBorder.none,
                      ),
                      onChanged: (searchQuery) {
                        debugPrint(searchQuery);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    onPressed: () {
                      debugPrint(
                          "Final String appending to function is ${controller.mapSearchingController.text}");
                      LocationService().alertBill(context);
                      debugPrint("Search Icon Pressed");
                    },
                    icon: const Icon(Icons.search),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: MediaQuery.of(context).size.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    controller.saveLatAndLong(latLong);
                    Get.to(()=>const UserChat());
                  },
                  child: Container(
                    height: 60.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: whiteColor,
                    ),
                    child: const Center(child: Text("Continue",style: TextStyle(color: warningColors),)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationService {
  alertBill(context) {
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.info,
      title: "Google Places Api",
      text: "You must to add Billing",
    );
  }
}
