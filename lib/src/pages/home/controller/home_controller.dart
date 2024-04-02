import 'package:get/get.dart';
import '../../../models/company_sites_models.dart';
import '../../../models/task_models.dart';
import '../../../services/util_services.dart';
import '../../auth/controller/auth_controller.dart';
import '../../sites_company/controller/company_sites_controller.dart';
import 'repository/home_repository.dart';
import '../result/task_result.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilServices = UtilServices();
  final authController = Get.find<AuthController>();
  final List<CompanySitesModels> listSiteCompany = [];
   List<TaskModels> listTaskModels = [];
  final List<TaskModels> listTaskOrden = [];
  final companySitesController = Get.find<SitesCompanyController>();
  RxBool isLoading = false.obs;
  RxBool isLoadingTask = false.obs;
  RxBool valor = true.obs;

  @override
  onInit() {
    super.onInit();
    getAllTask();
  }

    removeTask(int index){

      listTaskModels.removeAt(index);
      update();
    }

  Future<void> getAllTask() async {
    listSiteCompany.clear();
    listTaskModels.clear();

    isLoading.value = true;
    final TaskResult<List<TaskModels>> result =
        await homeRepository.getAllTask();

    result.when(
      scess: (success) async {
        for (var listTask in success) {
          if (listTask.supervisorCode == authController.user.employeeId) {
            listTaskOrden.add(listTask);

      

            final listSite =
                await homeRepository.getAllCompanySiteId(listTask.costCenter);

            listSite.when(sucess: (result) {
              listSiteCompany.add(result);
            }, error: (message) {
              utilServices.showToast(text: message);
            });
          }
        }
         listTaskModels = listTaskOrden..sort((a, b) => b.createdAt.compareTo(a.updatedAt));
        isLoading.value = false;
        valor.value = isLoading.value;
        update();
      },
      error: (message) {
        utilServices.showToast(text: message);
      },
    );
  }
}
