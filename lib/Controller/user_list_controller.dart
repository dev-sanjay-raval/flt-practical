import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:i_genious/Models/user_content_response_model.dart';

class UserListController extends GetxController{
    ///Variables..
    final RxString title = "User List".obs;
    RxList userData = [].obs;
    RxList<Marker> markers = <Marker>[].obs;

    ///Methods..
    Future<void> getUserData() async {

        var response = await http.get(Uri.parse(
            'https://raw.githubusercontent.com/mwgg/Airports/master/airports.json'));
        if (response.statusCode == 200) {
            Map<String, dynamic> data = jsonDecode(response.body);
            print(data.length);
            for (var kv in data.entries) {
                userData.add(UserContentResponseModel(
                    icao: kv.value['icao'],
                    name: kv.value['name'],
                    city: kv.value['city'],
                    state: kv.value['state'],
                    country: kv.value['country'],
                    elevation: kv.value['elevation'],
                    lat: double.tryParse(kv.value['lat'].toString()),
                    lon: double.tryParse(kv.value['lon'].toString()),
                    tz: kv.value['tz']));
            }
            userData.refresh();
        } else {
            print('Request failed with status: ${response.statusCode}.');
        }
    }

    Future<void> getMarkers({BuildContext? context}) async {
        int id = 0 ;
        for (var i in userData) {
            id++;
            markers.add(Marker(
                markerId: MarkerId(id.toString()),
                position: LatLng(
                    double.tryParse(i.lat.toString())!
                        .toDouble(),
                    double.tryParse(i.lon.toString())!
                        .toDouble()),
                infoWindow: InfoWindow(title: i.name),
                onTap: (){
                    showDialog(context: context!, builder: (context) {
                        return Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                                height: 90,
                                width: 90,
                                color: Colors.red,
                                child: Text(i.name),
                            ),
                        );
                    });
                }
            ),
            );
        }
        markers.refresh();
    }
}