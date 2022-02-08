import 'package:evento_user/api_helper/api_constants.dart';
import 'package:evento_user/controller/user_map_marking/user_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserChat extends StatelessWidget {
  const UserChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(() => const OpenMarkedMap());
                  },
                  child: const Text(
                    'View on Map',
                    style: TextStyle(color: Colors.redAccent, fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OpenMarkedMap extends StatefulWidget {
  const OpenMarkedMap({Key? key}) : super(key: key);

  @override
  _OpenMarkedMapState createState() => _OpenMarkedMapState();
}

class _OpenMarkedMapState extends State<OpenMarkedMap> {
  static const secureStorage = FlutterSecureStorage();
  static final controller = UserPlaceMarking.userPlaceMarking;
  Set<Marker> _markers = {};

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(controller.latitude,controller.longitude),
    zoom: 14.4746,
  );

  @override
  void initState(){
    addMarker();
    super.initState();
  }

  addMarker(){
    _markers.add(Marker(markerId: const MarkerId('M@'),position: LatLng(controller.latitude,controller.longitude)));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          markers: _markers,
          initialCameraPosition: _kGooglePlex,
        ),
      ),
    );
  }
}
