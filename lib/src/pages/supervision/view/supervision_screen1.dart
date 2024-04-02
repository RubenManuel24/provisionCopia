import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../../models/company_sites_models.dart';
import '../../../page_routes/app_pages.dart';
import '../../../services/util_services.dart';
import '../../history/controller/history_controller.dart';
import '../../history/view/components/modal_history.dart';
import '../../home/controller/home_controller.dart';
import '../../sites_company/controller/company_sites_controller.dart';
import '../controller/supervision_controller.dart';
import 'components/modal_supervuisionPages.dart';

class SupervisionScreen1 extends StatefulWidget {
  final CompanySitesModels companySitesModels = Get.arguments;

  SupervisionScreen1({super.key});

  @override
  State<SupervisionScreen1> createState() => _SupervisonTabState();
}

class _SupervisonTabState extends State<SupervisionScreen1> {
  final supervisorController = Get.find<SupervisionController>();
  final sitesCompanyController = Get.find<SitesCompanyController>();
  final homeController = Get.find<HomeController>();
  Color colorActive = Colors.grey;
  bool presentIconArrow = true;
  final historyController = Get.find<HistoryController>();

  UtilServices utilServices = UtilServices();

  @override
  void initState() {
    super.initState();
    supervisorController.startTimer();
  }

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
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 55),
        child: Obx(
          () => AppBar(
            leading: supervisorController.active.value
                ? Container()
                : IconButton(
                    onPressed: () {
                      Get.back();
                      supervisorController.idTask = null;
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: CustomColors.customBlueColor,
            title: Column(
              children: [
                const Text(
                  "Supervisão",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Visibility(
                  visible: supervisorController.active.value,
                  child: Column(
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        utilServices
                            .getTimeString(supervisorController.duration),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Site:",
                            style: TextStyle(
                                fontSize: 16,
                                color: CustomColors.customBlueColor,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 5),
                        Text(
                            widget.companySitesModels.name.length > 25
                                ? '${widget.companySitesModels.name.substring(0, 25)}...'
                                : widget.companySitesModels.name,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text("Centro de custo:",
                            style: TextStyle(
                                fontSize: 16,
                                color: CustomColors.customBlueColor,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 5),
                        Text(widget.companySitesModels.costCenter,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 5, thickness: 2, color: Colors.grey),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  GetBuilder<SupervisionController>(
                    builder: (supervisorController) => ModalPages(
                      onTap: () {
                        Get.toNamed(
                          PageRoutes.sitesDatails,
                          arguments: widget.companySitesModels,
                        );
                      },
                      active: supervisorController.active.value,
                      color: colorActive,
                      texto: 'Localização',
                      icon: "assets/icons/locationmap.png",
                    ),
                  ),
                  GetBuilder<SupervisionController>(
                    builder: (supervisorController) => ModalPages(
                      onTap: () {
                        Get.toNamed(
                          PageRoutes.employeeRoute,
                          arguments: widget.companySitesModels,
                        );
                      },
                      active: supervisorController.active.value,
                      color: colorActive,
                      texto: 'Pessoal',
                      icon: "assets/icons/verificacao.png",
                    ),
                  ),
                  GetBuilder<SupervisionController>(
                    builder: (supervisorController) => ModalPages(
                      onTap: () => Get.toNamed(
                        PageRoutes.equipmentRoute,
                        arguments: widget.companySitesModels,
                      ),
                      active: supervisorController.active.value,
                      color: colorActive,
                      icon: "assets/icons/equipamentos.png",
                      texto: 'Equipamentos',
                    ),
                  ),
                  GetBuilder<SupervisionController>(
                    builder: (supervisorController) => ModalPages(
                      onTap: () => Get.toNamed(PageRoutes.diverseRoute),
                      active: supervisorController.active.value,
                      color: colorActive,
                      icon: "assets/icons/diverse.png",
                      texto: 'Relatório',
                    ),
                  ),
                  GetBuilder<SupervisionController>(
                    builder: (supervisorController) => ModalHistory(
                      onTap: () {
                        supervisorController.nameSite =   widget.companySitesModels.name;
                        supervisorController.constCenter =
                            widget.companySitesModels.costCenter;
                        Get.toNamed(PageRoutes.historyRoute);
                      },
                      icon: "assets/icons/historico.png",
                      texto: 'Históricos',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: supervisorController.isLoading.value
                  ? AlertDialog(
                      title: Center(
                        child: CircularProgressIndicator(
                            color: CustomColors.customBlueColor,
                            backgroundColor: CustomColors.customOrangeColor,
                            strokeWidth: 8),
                      ),
                      content: const Text(
                        "Enviando os Dados",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          isExtended: true,
          onPressed: () async {

              if (!supervisorController.active.value) {
                bool? result;

                result = await showDialogConfirm(
                    "Deseja realmente iniciar a supervisão?");

                if (result ?? false) {
                  supervisorController
                      .setActive(!supervisorController.active.value);
                  colorActive = supervisorController.active.value
                      ? Colors.green
                      : Colors.grey;

                  // Atualize a variável diretamente
                  presentIconArrow = supervisorController.active.value;

                  // Reinicie o contador ao clicar no botão
                  if (!supervisorController.active.value) {
                    supervisorController.reset();
                  }
                  utilServices.showToast(text: "Começando a supervisão!");
                }
              } else {
                bool? result;

                result = await showDialogConfirm(
                    "Deseja realmente terminar a supervisão?");

                if (result ?? false) {
                  supervisorController
                      .setActive(!supervisorController.active.value);
                  colorActive = supervisorController.active.value
                      ? Colors.green
                      : Colors.grey;

                  // Atualize a variável diretamente
                  presentIconArrow = supervisorController.active.value;

                  // Reinicie o contador ao clicar no botão
                  if (!supervisorController.active.value) {
                    supervisorController.sendData(
                      costCenterSite: widget.companySitesModels.costCenter,
                      numberOfWorkers: supervisorController.employeePresent,
                      workerInformation: supervisorController.lisEmployeeModel,
                      report: supervisorController.relateText,
                      equipment: supervisorController.listEquipmentModels,
                      timer: supervisorController.lastDuration.toString(),
                    );


                    //homeController.removeTask(supervisorController.indexTask);


                    Future.delayed(const Duration(milliseconds: 3000), () {
                      supervisorController.lisEmployeeModel = [];
                      supervisorController.listEquipmentModels = [];
                      historyController.getAllHistory();
                      homeController.getAllTask();
                    });


                    supervisorController.reset();
                  }
                  utilServices.showToast(text: "Terminando a supervisão!");
                }
              }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.power_settings_new,
                size: 18,
                color: supervisorController.colorIcon.value,
              ),
              Text(
                supervisorController.textButton.value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
