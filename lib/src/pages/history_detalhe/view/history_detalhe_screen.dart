import 'package:Provision/src/pages/auth/controller/auth_controller.dart';
import 'package:Provision/src/services/util_services.dart';
import 'package:Provision/src/pages/history_detalhe/controller/history_detalhes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../employees/view/components/tile_obs_employee.dart';
import '../../equipment/view/components/tile_registering_equipment.dart';
import 'components/row_text_history.dart';

class HistoryDetalheScreen extends StatefulWidget {
  HistoryDetalheScreen({super.key});

  @override
  State<HistoryDetalheScreen> createState() => _HistoryDetalheScreenState();
}

class _HistoryDetalheScreenState extends State<HistoryDetalheScreen> {
  final historyDetalhesController = Get.find<HistoryDetalhesController>();

  final authController = Get.find<AuthController>();

  UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: CustomColors.customBlueColor,
          title: const Text(
            "Detalhe do Histórico",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Obx(() => historyDetalhesController.isLoadingSupervision.value
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: CustomColors.customBlueColor,
                    strokeWidth: 3,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text("Carregando..")
                ],
              ))
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Identificação",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          RowTextHistory(
                              text1: 'Data:',
                              text2: utilServices.formatDate(DateTime.parse(
                                  historyDetalhesController
                                      .superVisionModel.createAt
                                      .toString()))),
                          const SizedBox(
                            height: 10,
                          ),
                          RowTextHistory(
                            text1: 'Nome:',
                            text2: authController.user.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RowTextHistory(
                            text1: 'Mec do supervisor:',
                            text2: historyDetalhesController
                                .superVisionModel.supervisorCode
                                .toString(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RowTextHistory(
                            text1: 'Centro de custo:',
                            text2: historyDetalhesController
                                .superVisionModel.costCenter
                                .toString(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RowTextHistory(
                              text1: 'Tempo de execução:',
                              text2: utilServices.formatTime(
                                  historyDetalhesController
                                      .superVisionModel.time
                                      .toString())),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 5,
                            thickness: 2,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Pessoal",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          RowTextHistory(
                            text1: 'Número de pessoal pretendido:',
                            text2: historyDetalhesController
                                    .superVisionModel.desiredNumber
                                    .toString(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RowTextHistory(
                            text1: 'Número de pessoal encontrado:',
                            text2: historyDetalhesController
                                .superVisionModel.numberOfWorkers
                                .toString(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Informações extra do Pessoal"),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 15, right: 15),
                              child: Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  height: 250,
                                  child: historyDetalhesController
                                          .superVisionModel
                                          .workerInformation!
                                          .isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 10),
                                          child: ListView.separated(
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(height: 3),
                                              itemBuilder: (context, index) {
                                                final employees =
                                                    historyDetalhesController
                                                            .superVisionModel
                                                            .workerInformation![
                                                        index];
                                                return TileObsEmployee(
                                                    employeeModel: employees);
                                              },
                                              itemCount:
                                                  historyDetalhesController
                                                      .superVisionModel
                                                      .workerInformation!
                                                      .length),
                                        )
                                      : const Center(
                                          child: Text("Vazio!"),
                                        ))),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 5,
                            thickness: 2,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Equipamento",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          RowTextHistory(
                            text1: 'Número de equipamentos presente no site:',
                            text2: historyDetalhesController.quantEquipment
                                .toString(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Informações extra do Equipamento"),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 15, right: 15),
                              child: Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  height: 250,
                                  child: historyDetalhesController
                                          .superVisionModel
                                          .equipment!
                                          .isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 10),
                                          child: ListView.separated(
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(height: 3),
                                              itemBuilder: (context, index) {
                                                final equipmentModels =
                                                    historyDetalhesController
                                                        .superVisionModel
                                                        .equipment![index];
                                                return TileRegisteringEquipment(
                                                    equipmentModels:
                                                        equipmentModels);
                                              },
                                              itemCount:
                                                  historyDetalhesController
                                                      .superVisionModel
                                                      .equipment!
                                                      .length),
                                        )
                                      : const Center(
                                          child: Text("Vazio!"),
                                        ))),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 5,
                            thickness: 2,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Relatório",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 8, right: 8),
                              child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(17)),
                                      color: Colors.white),
                                  height: 300,
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(historyDetalhesController
                                            .superVisionModel.report
                                            .toString()),
                                      )
                                    ],
                                  ))),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text("OBS: Gerado pelo sistema",
                                  style: TextStyle(fontSize: 9))),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 15,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          historyDetalhesController.createPDF(
                              historyDetalhesController.superVisionModel
                            );
                        },
                        child: Image.asset('assets/icons/pdf.png', width: 40),
                      )),
                ],
              )));
  }
}
