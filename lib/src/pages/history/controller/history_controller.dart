import 'dart:io';

import 'package:Provision/src/models/history_models.dart';
import 'package:Provision/src/pages/auth/controller/auth_controller.dart';
import 'package:Provision/src/pages/history/repository/history_repository.dart';
import 'package:Provision/src/pages/history/result/history_model_result.dart';
import 'package:Provision/src/pages/supervision/controller/supervision_controller.dart';
import '../../../services/util_services.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final historyRepository = HistoryRepository();
  UtilServices utilServices = UtilServices();
  List<HistoryModels> listHistory = [];
  List<HistoryModels> listHistory1 = [];
  List<HistoryModels> listHistoryRelatorio = [];
  final supervisionController = Get.find<SupervisionController>();
  final authController = Get.find<AuthController>();
  String constCenterSite = " ";
  bool isLoading = false;
  

  @override
  onInit() async {
    super.onInit();
    getAllHistory();
  }

  Future<void> getAllHistory() async {
    isLoading = true;
    listHistory.clear();
    final HistoryModelResult<List<HistoryModels>> historyModelResult =
        await historyRepository.getAllHistory();

    historyModelResult.when(sucess: (result) {
        isLoading = false;
      for(var historySupervision in result){
        if(authController.user.employeeId == historySupervision.supervisorCode){
            listHistoryRelatorio.add(historySupervision);
        }
      }
      for (var historyModel in result) {
        // Lista para armazenar os históricos relevantes para o site atual
        var relevantHistory = <HistoryModels>[];
         if (historyModel.costCenter == supervisionController.constCenter) {
            relevantHistory.add(historyModel);
          }
        if (relevantHistory.isNotEmpty) {
          listHistory.add(historyModel);
        } else {}
      }
        listHistory1 = listHistory..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

      update();
    }, error: (message) {
      utilServices.showToast(text: message);
    });
  }


}
