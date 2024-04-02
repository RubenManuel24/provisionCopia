import 'package:Provision/src/pages/history/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../../page_routes/app_pages.dart';
import '../../../services/util_services.dart';
import '../../common_widget/cstom_shimmer_list.dart';
import '../../history_detalhe/controller/history_detalhes_controller.dart';
import '../../supervision/controller/supervision_controller.dart';
import '../controller/history_controller.dart';
import 'components/tile_card_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final supervisorController = Get.find<SupervisionController>();
  final historyDetalhesController = Get.find<HistoryDetalhesController>();
  final ScrollController _scrollController = ScrollController();
  final historyController = Get.find<HistoryController>();
  UtilServices utilServices = UtilServices();

  @override
  void initState() {
     historyController.getAllHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: CustomColors.customBlueColor,
        title: Column(
          children: [
            const Text(
              "Históricos",
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
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: GetBuilder<HistoryController>(builder: (historyController) {
            return historyController.isLoading
                ? ListView(physics: const BouncingScrollPhysics(), children: [
                    CustomShimmerList(),
                    const SizedBox(height: 10),
                    CustomShimmerList(),
                    const SizedBox(height: 10),
                    CustomShimmerList(),
                    const SizedBox(height: 10),
                    CustomShimmerList(),
                    const SizedBox(height: 10),
                    CustomShimmerList(),
                    const SizedBox(height: 10),
                    CustomShimmerList(),
                    const SizedBox(height: 10),
                    CustomShimmerList(),
                    const SizedBox(height: 10),
                    CustomShimmerList(),
                    const SizedBox(height: 10),
                    CustomShimmerList(),
                  ])
                : historyController.listHistory1.isEmpty
                    ? const Center(
                        child: Text("Vazio"),
                      )
                    : ListView.separated(
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: historyController.listHistory1.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 2),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final historyModel =
                              historyController.listHistory1[index];
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: SizedBox(
                              height: 70,
                              width: 200,
                              child: GestureDetector(
                                onTap: () {
                                           Get.toNamed(
                                    PageRoutes.historyDetalheRoute,
                                  );
                                   historyDetalhesController.getAllSupervisor(
                                      idSupervision:
                                          historyModel.supervisionId);
                                },
                                child: TileCardHistory(
                                  historyModels: historyModel,
                                ),
                              ),
                            ),
                          );
                        },
                      );
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: CustomColors.customBlueColor,
          child: const Icon(
            Icons.arrow_drop_up_sharp,
            color: Colors.white,
            size: 30,
          )),
    );
  }
}
