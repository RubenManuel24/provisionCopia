
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../config/custom_colors.dart';
import '../../../models/company_sites_models.dart';
import '../../base/controller/navigation_controller.dart';
import '../../common_widget/custom_botton.dart';
import '../../common_widget/row_text.dart';
import '../../sites_company/controller/company_sites_controller.dart';
import '../../supervision/controller/supervision_controller.dart';
import '../controller/sites_controller.dart';

class SitesDetailsScren extends StatefulWidget {
  final CompanySitesModels companySitesModels = Get.arguments;
  SitesDetailsScren({super.key});

  @override
  State<SitesDetailsScren> createState() => _SitesDetailsScrenState();
}

class _SitesDetailsScrenState extends State<SitesDetailsScren> {
  final sitesController = Get.find<SitesController>();
  final supervisionController = Get.find<SupervisionController>();
  final navigationController = Get.find<NavigationController>();
  final sitesCompanyController = Get.find<SitesCompanyController>();

  @override
  void initState() {
    super.initState();
    sitesController.getDadaSitesCompany(widget.companySitesModels);
  }

  Future<bool?> showDialogConfirm() {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Confirmação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "Desejas atualizar a localização?",
            style: TextStyle(fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "Não",
                style: TextStyle(color: CustomColors.customBlueColor),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.customBlueColor),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                "Sim",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDialogProgress(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Atualizando localização..."),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ofSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GetBuilder<SitesController>(
        builder: (sitesController){
          return Stack(
        alignment: Alignment.topCenter,
        children: [
         GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: sitesController.mapType,
              initialCameraPosition: CameraPosition(
                target: sitesController.position,
                zoom: 17.101626040649414,
              ),
              onMapCreated: sitesController.onMapCreated,
              markers: sitesController.sitesCompany.latitude == "401.0" &&
                      sitesController.sitesCompany.longitude == "401.0"
                  ? <Marker>{}
                  : sitesController.markers,
            ),
          Positioned(
            bottom: 110,
            right: 15,
            child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      sitesController.modificMap();
                    },
                    child: Text(sitesController.nameMap))

          ),
          Positioned(
            left: 10,
            top: 15,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: CustomColors.customBlueColor,
              ),
            ),
          ),
          Positioned(
              top: 60,
              child: Column(
                children: [
                  RowText(
                    text1: 'Site: ',
                    text2: widget.companySitesModels.name.length > 25
                        ? '${widget.companySitesModels.name.substring(0, 25)}...'
                        : widget.companySitesModels.name,
                  ),
                ],
              )),
          Visibility(
            visible: sitesController.sitesCompany.latitude == "401.0",
            child: Visibility(
              visible: sitesController.buttonUpdateLocation,
              child: Positioned(
                bottom: 60,
                child: CustomButton(
                  text: "Atualizar a localização",
                  color: CustomColors.customBlueColor,
                  onPressed: () async {
                    bool? result = await showDialogConfirm();
                    if (result ?? false) {
                      sitesController.updateLocation(
                          costCenter: sitesController.sitesCompany.costCenter,
                          clientCode: sitesController.sitesCompany.clientCode);
                      sitesController.buttoUpdate();
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

        ],
      );
        },)
    );
  }
}
