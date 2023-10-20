import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_genious/Controller/user_detail_controller.dart';
import 'package:i_genious/Helper/theme.dart';
import 'package:i_genious/Models/user_content_response_model.dart';
import 'package:i_genious/WIdgets/row_widget.dart';

class UserDetailScreen extends StatelessWidget {
  UserContentResponseModel? userData;

  UserDetailScreen({super.key, this.userData});
  UserDetailController controller = Get.put(UserDetailController());

  @override
  Widget build(BuildContext context) {
    return GetX<UserDetailController>(
      init: controller,
      initState: (_) {
        controller.latitude.value = userData?.lat ?? 0.0;
        controller.longitude.value = userData?.lon ?? 0.0;
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(userData?.name ?? ""),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Themes.primaryColor.shade100,
                     // borderRadius: BorderRadius.circular(30.0)
                    ),
                    //color: Colors.white,
                    child: controller.latitude.value != null
                        ? Card(
                      margin: EdgeInsets.all(15),
                      elevation: 2.0,
                          clipBehavior: Clip.antiAlias,
                          child: GoogleMap(
                              zoomGesturesEnabled: true,
                              initialCameraPosition: CameraPosition(target: LatLng(controller.latitude.value, controller.longitude.value),zoom: 5.0),
                              mapType: MapType.normal,
                            // markers: Set<Marker>.of(userListController.markers),
                              markers: {
                                Marker(
                                    markerId: MarkerId(userData?.name ?? ""),
                                    position:
                                        LatLng(controller.latitude.value , controller.longitude.value))
                              },
                              onMapCreated:
                                  (GoogleMapController googleMapController) {
                                controller.mapController = googleMapController;
                                controller.mapController;
                              },
                            ),
                        )
                        : Center(child: CircularProgressIndicator(color: Themes.primaryColor),)),
              ),
              //SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Themes.primaryColor.shade100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
                    child: Card(
                      elevation: 5.0,
                      color: Themes.primaryColor.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RowWidget(
                                title: "Name",
                                labelName: userData?.name),
                            RowWidget(
                                title: "Tz", labelName: userData?.tz),
                            RowWidget(
                                title: "Country",
                                labelName: userData?.country),
                            RowWidget(
                                title: "City/State",
                                labelName: userData?.city)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
