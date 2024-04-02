import '../../../constants/end_points.dart';
import '../../../models/company_sites_models.dart';
import '../../../services/http_manager.dart';
import '../result/company_sites_result.dart';

class CompanySitesRepository {
  HttpManager _httpManager = HttpManager();

  Future<CompanySitesModelsResult<List<CompanySitesModels>>>
      getAllSitesCompany() async {
    final result = await _httpManager.resRequest(
      urlEndPoint: Endpoints.companuSite,
      method: HttpMethods.get,
    );
    if (result != null &&
        result["data"] != null &&
        result["data"]["data"] != null) {
      final List<CompanySitesModels> sites =
          List<Map<String, dynamic>>.from(result["data"]["data"])
              .map((e) => CompanySitesModels.fromMap(e))
              .toList();

      return CompanySitesModelsResult<List<CompanySitesModels>>.sucess(sites);
    } else {
      return CompanySitesModelsResult.error(
          "Não foi possível recuperar os sites");
    }
  }
}
