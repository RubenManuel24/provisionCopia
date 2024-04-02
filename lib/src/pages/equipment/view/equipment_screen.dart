import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../../models/company_sites_models.dart';
import '../../../page_routes/app_pages.dart';
import '../../../services/util_services.dart';
import '../../supervision/controller/supervision_controller.dart';
import 'components/tile_registering_equipment.dart';

class EquipmentScreen extends StatefulWidget {
  final CompanySitesModels companySitesModels = Get.arguments;
  EquipmentScreen({super.key});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  final supervisorController = Get.find<SupervisionController>();
  UtilServices utilServices = UtilServices();

  Future<bool?> showDialogConfirm(String confirmation) {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Confirmação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            confirmation,
            style: const TextStyle(fontSize: 13),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: CustomColors.customBlueColor,
        title: Column(
          children: [
            const Text(
              "Equipamentos",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Obx(
              () => Text(
                utilServices.getTimeString(supervisorController.duration),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: GetBuilder<SupervisionController>(
              builder: (equipmentController) => Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Equipamentos presente no Site",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                      padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
                      child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          height: 380,
                          child:
                              equipmentController.listEquipmentModels.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(height: 3),
                                          itemBuilder: (context, index) {
                                             final equipment = equipmentController
                                                .listEquipmentModels[index];
                                            return TileRegisteringEquipment(
                                                equipmentModels: equipment);
                                          },
                                          itemCount: equipmentController
                                              .listEquipmentModels.length),
                                    )
                                  : const Center(child: Text("Vazio!")))),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                          "Quantidade de equipamentos no site:",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                          equipmentController.listEquipmentModels.length
                              .toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: CustomColors.customBlueColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 5,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Registrar equipameto presente no site:",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        ElevatedButton.icon(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.customBlueColor),
                            onPressed: () =>
                                Get.toNamed(
                                  PageRoutes.registeringEquipmentRoute,
                                  arguments: widget.companySitesModels
                              ),
                            label: const Text(
                              "Registrar",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? result;

          result = await showDialogConfirm(
              "Deseja realmente terminar a supervisão nos equipamentos?");
            
          if (result ?? false) {
            Get.back();
          }
        },
        child: const Text("Enviar"),
      ),
    );
  }
}
