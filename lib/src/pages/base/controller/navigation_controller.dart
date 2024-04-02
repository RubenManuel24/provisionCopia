import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:Provision/src/pages/sites_company/controller/company_sites_controller.dart';
import 'package:Provision/src/pages/sites_datails/controller/sites_controller.dart';
import 'package:Provision/src/services/util_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/location_model.dart';
import '../repository/base_repository.dart';

abstract class NavigationTab {
  static const int home = 0;
  static const int company = 1;
  static const int chat = 2;
  static const int certification = 3;
}

class NavigationController extends GetxController {
  BaseRepository baseRepository = BaseRepository();
  late PageController _pageController;
  late RxInt _currentIndex;
  late StreamSubscription<Position> positionStream;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  //late LatLng currentPosition;
  RxString locationName = ''.obs;
  List<LocationModel> locationCurrent = [];
  late SharedPreferences prefs;
  Position? position;
  double radius = 800.0;
  Position? currentPosition;
  bool isLoadingLocationCurrent = false;

  //Metodo para iniciar a navegacao da pagina
  void _initNavigationPage(
      {required PageController pageController, required int currentIndex}) {
    _pageController = pageController;
    _currentIndex = currentIndex.obs;
  }

  PageController get pageController => _pageController;
  int get currentIndex => _currentIndex.value;

  @override
  void onInit() async {
    _initNavigationPage(
        pageController: PageController(initialPage: NavigationTab.home),
        currentIndex: NavigationTab.home);
    position = await Geolocator.getCurrentPosition();
    prefs = await SharedPreferences.getInstance();
    addListLocationCurrent();
    super.onInit();
  }

  void naviationPageView(int page) {
    if (_currentIndex == page) return;

    _pageController.jumpToPage(page);
    _currentIndex.value = page;
  }

  addListLocationCurrent() async {
    currentPosition = position;

    locationCurrent.add(LocationModel(
      latitude: position!.latitude,
      longitude: position!.longitude,
      time: DateTime.now(),
    ));
    prefs.setDouble('lat', position!.latitude);
    prefs.setDouble('lng', position!.longitude);
    print(
        'Primeira instancia ====>>> Latitude ${position!.latitude} || Longitude ${position!.longitude}');
    sendLocationCurrent();

    update();
  }

  Future<void> watchPosition() async {
    position = await Geolocator.getCurrentPosition();
    currentPosition = position;

    double? latitude1 = prefs.getDouble('lat');
    double? longitude1 = prefs.getDouble('lng');

    double distance = calculateDistance(
        latitude1!, longitude1!, position!.latitude, position!.longitude);
    if (distance < radius) {
      print(
          'Está no mesmo raio ====>  Distancia:${distance} || Raio ${radius}');
      return;
    } else {
      try {
        await prefs.remove('lat');
        await prefs.remove('lng');
        await prefs.setDouble('lat', position!.latitude);
        await prefs.setDouble('lng', position!.longitude);
        locationCurrent.removeAt(0);
        locationCurrent.add(LocationModel(
          latitude: position!.latitude,
          longitude: position!.longitude,
          time: DateTime.now(),
        ));

        print('lISTA ${locationCurrent.length}');

        print(
            'Restante instancia ====>>> Latitude ${position!.latitude} || Longitude ${position!.longitude}');
        sendLocationCurrent();
        update();
      } catch (e) {
        Get.snackbar(
          "Erro",
          e.toString(),
          backgroundColor: Colors.grey[900],
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000; // Raio da Terra em metros

    double dLat = degreesToRadians(lat2 - lat1);
    double dLon = degreesToRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(lat1)) *
            cos(degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c; // Distância em metros
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  // Future<void> fetchLocationName(
  //     {required double lat, required double long}) async {
  //   final dio = Dio();
  //   final url =
  //       'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${long}&key=AIzaSyC_3JsRVuSy24_8HTGxj6d_x9oswpDXj_U';
  //   try {
  //     final response = await dio.get(url);
  //     if (response.statusCode == 200) {
  //       final decoded = json.decode(response.data);
  //       final results = decoded['results'];
  //       if (results != null && results.isNotEmpty) {
  //         locationName = results[0]['formatted_address'];
  //         print('Localização: ====> ${locationName} >====');
  //         update();
  //       }
  //     } else {
  //       throw Exception('Failed to load location data');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  Future<void> sendLocationCurrent() async {
    final result = await baseRepository.sendLocationCurrent(
        location: locationName.value,
        route: locationCurrent
            .map((location) => {
                  'lat': location.latitude,
                  'lng': location.longitude,
                  'time': location.time.toString()
                })
            .toList());

    update();
  }

  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

}
