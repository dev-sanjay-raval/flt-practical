import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserDetailController extends GetxController{
  RxList<Marker> markers = <Marker>[].obs;
  RxDouble  latitude = 0.0.obs;
  RxDouble  longitude = 0.0.obs;
  late GoogleMapController mapController;
}