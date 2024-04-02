import 'dart:async';
import 'dart:ui' as ui;
import 'package:Provision/src/pages/sites_company/controller/company_sites_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../models/company_sites_models.dart';
import '../../../services/util_services.dart';
import '../../base/controller/navigation_controller.dart';
import '../repository/sites_detauls_repository.dart';

class SitesController extends GetxController {
  final sitesDetaulsRepository = SitesDetaulsRepository();
  final LatLng _position = const LatLng(-8.9098, 13.1999);
  GoogleMapController? _googleMapController;
  final markers = Set<Marker>();
  late CompanySitesModels sitesCompany;
   UtilServices utilServices = UtilServices();
  final navigationController = Get.find<NavigationController>();
  final sitesCompanyController = Get.find<SitesCompanyController>();
  MapType mapType = MapType.normal;
  String nameMap = 'Normal';
   bool isLoadingLocationCurrent = false;
   bool buttonUpdateLocation = true;

   void buttoUpdate(){
    buttonUpdateLocation = false;
    sitesCompanyController.getAllSitesCompany();
    addLargeMarker();
    update();
   }

   void buttonDesative(){
    if(buttonUpdateLocation == false){
       buttonUpdateLocation = true;
    }
    print("VALIDACAO ${buttonUpdateLocation}");
    update();
   }

  void modificMap(){
   if(mapType == MapType.normal){
     print('Mudar para Satélite');
       mapType = MapType.satellite;
       nameMap = 'Satélite';
   }
   else{
     print('Mudar para Normal');
     mapType = MapType.normal;
     nameMap = 'Normal';
   }
    update();
  }





  get mapsController => _googleMapController;
  get position => _position;

  void onMapCreated(GoogleMapController controller) async {
  _googleMapController = controller;

  addLargeMarker();
  await navigationController.watchPosition();
  //updateCameraPosition(_position);
  update();
}

  void updateCameraPosition(var position) {
    if (_googleMapController != null) {
      _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15.0,
        ),
      ));
    }
  }

 void addLargeMarker() async {
    const double markerSize = 140.0;

    final BitmapDescriptor markerIcon = await getMarkerIcon(markerSize);

    markers.add(
      Marker(
        markerId: MarkerId(sitesCompany.name),
        position:  LatLng(
           double.parse(sitesCompany.latitude.toString()),
            double.parse(sitesCompany.longitude.toString()),),
        infoWindow: InfoWindow(title: sitesCompany.name),
        onTap: () {},
        icon: markerIcon,
      ),
    );

    update();
  }

  getDadaSitesCompany(CompanySitesModels companySitesModels){
       sitesCompany = companySitesModels;
  }

  Future<BitmapDescriptor> getMarkerIcon(double size) async {
    final ByteData data = await rootBundle.load('assets/icons/locationmap.png');
    final Uint8List bytes = data.buffer.asUint8List();
    
    final ui.Codec codec = await ui.instantiateImageCodec(
      bytes,
      targetWidth: 140, // Define a largura desejada
      targetHeight: 140, // Define a altura desejada
    );
    
    final ui.FrameInfo fi = await codec.getNextFrame();
    
    return BitmapDescriptor.fromBytes(Uint8List.fromList((await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List()));
  }


  
  Future<void> updateLocation({
    required String costCenter,
    required String clientCode,
  }) async {
     isLoadingLocationCurrent = true;
    final result = await sitesDetaulsRepository.updateLocation(
        costCenter: costCenter,
        clientCode: clientCode,
        currentPosition: navigationController.currentPosition);

    if (result) {
      isLoadingLocationCurrent = false;
      utilServices.showToast(text: "Localização do Site actualizada!");
      update();
    } else {
      utilServices.showToast(text: "Localização não foi actualizada!");
    }
  }




}