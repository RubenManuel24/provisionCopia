import 'package:get/get.dart';
import '../../../models/company_model.dart';
import '../../../models/company_sites_models.dart';
import '../../../services/util_services.dart';
import '../../sites_company/controller/company_sites_controller.dart';
import '../repository/company_repository.dart';
import '../result/company_model_result.dart';

class CompanyController extends GetxController {
  final companyRepository = CompanyRepository();
  UtilServices utilServices = UtilServices();
  List<CompanyModel> listcompanyModel = [];
  final companySitesController = Get.find<SitesCompanyController>();
  RxBool isLoadingCompany = false.obs;

  @override
  onInit() async {
    getAllCompany();
  }

  Future<void> getAllCompany() async {
    isLoadingCompany.value = true;
    CompanyModelResult<List<CompanyModel>> companyModelResult =
        await companyRepository.getAllCompany();

    companyModelResult.when(
      sucess: (result) {
        isLoadingCompany.value = false;
        listcompanyModel.clear();
        for (var companyModel in result) {
          // Lista para armazenar os sites relevantes para a empresa atual
          var relevantSites = <CompanySitesModels>[];

          for (var companySite in companySitesController.listCompanySites) {
            if (companyModel.clientCode == companySite.clientCode) {
              relevantSites.add(companySite);
            }
          }
          // Agora você pode acessar a lista relevantSites fora do loop
          if (relevantSites.isNotEmpty) {
            listcompanyModel.add(companyModel);
          } else {}
        }
        update();
      },
      error: (message) {
        utilServices.showToast(text: message);
      },
    );
  }
}
