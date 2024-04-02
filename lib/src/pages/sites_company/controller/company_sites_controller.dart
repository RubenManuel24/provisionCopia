import 'package:get/get.dart';

import '../../../models/company_sites_models.dart';
import '../../../services/util_services.dart';
import '../../auth/controller/auth_controller.dart';
import '../repository/company_sites_repository.dart';
import '../result/company_sites_result.dart';

class SitesCompanyController extends GetxController {
  final companySitesRepository = CompanySitesRepository();
  List<CompanySitesModels> listCompanySites = [];
  UtilServices utilServices = UtilServices();
  final authController = Get.find<AuthController>();
  String constCenterSite = " ";
  RxBool isLoadingSitesCompany = false.obs;
  String quantEmployeePresent = " ";

  @override
  void onInit() {
    super.onInit();
    getAllSitesCompany();
  }

   Future<void> getAllSitesCompany() async {
    isLoadingSitesCompany.value = true;
    CompanySitesModelsResult<List<CompanySitesModels>>
        companySitesModelsResult =
        await companySitesRepository.getAllSitesCompany();

    companySitesModelsResult.when(
      sucess: (result) {
         isLoadingSitesCompany.value = false;
         listCompanySites.clear();

        for (var companySites in result) {
          
          if (companySites.supervisorCode == authController.user.employeeId) {
        
            listCompanySites.add(companySites);
       
          } 
        }
      
        
        update();
      },
      error: (message) {
       
        utilServices.showToast(text: message);
      },
    );
}}
