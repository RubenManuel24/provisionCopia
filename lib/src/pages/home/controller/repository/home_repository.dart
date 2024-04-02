import '../../../../constants/end_points.dart';
import '../../../../models/company_sites_models.dart';
import '../../../../models/task_models.dart';
import '../../../../services/http_manager.dart';
import '../../result/company_site_id_result.dart';
import '../../result/task_result.dart';

class HomeRepository {
  HttpManager _httpManager = HttpManager();

  Future<TaskResult<List<TaskModels>>> getAllTask() async {
    final result = await _httpManager.resRequest(
      urlEndPoint: Endpoints.task,
      method: HttpMethods.get,
    );
    if (result != null && result["data"] != null && result["data"]["data"] != null) {
      final List<TaskModels> stack = List<Map<String, dynamic>>.from(result["data"]["data"])
              .map((e) => TaskModels.fromMap(e)).toList();
      return TaskResult<List<TaskModels>>.scess(stack);
    } else {
      return TaskResult.error("Não foi possível recuperar as tarefas");
    }
  }


  

   Future<CompanySitesModelsResult<CompanySitesModels>> getAllCompanySiteId(String siteId) async {
    final result = await _httpManager.resRequest(
      urlEndPoint: Endpoints.companySiteId+siteId,
      method: HttpMethods.get,
      );
   if (result != null && result["data"] != null) {
    print("-------> ${result["data"]} <-------");
  final CompanySitesModels sites = CompanySitesModels.fromMap(result["data"]);

   
  return CompanySitesModelsResult<CompanySitesModels>.sucess(sites);
} else {
  return CompanySitesModelsResult.error("Não foi possível recuperar os sites para as tarefas");
}
  }


}
