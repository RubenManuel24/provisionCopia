import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../constants/end_points.dart';
import '../../../services/http_manager.dart';

class SupervisionRepository {
  HttpManager _httpManager = HttpManager();

  Future<bool> sendData(
      {required int numberOfWorkers,
      required List<Map<String, dynamic>> workerInformation,
      required String report,
      required List<Map<String, dynamic>> equipment,
      required String? taskId,
      required String time,
      required String costCenter,
      required String? employeeId}) async {
    var url = Uri.parse(
      Endpoints.sendData + employeeId.toString(),
    );
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "workerInformation": workerInformation,
      "report": report,
      "equipment": equipment,
      "taskId": taskId,
      "time": time,
      "costCenter": costCenter,
      "numberOfWorkers": numberOfWorkers
    });

    try {
      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        print('<<<<<< Corpo da Resposta >>>>>>: ${response.body}');
        return true;
      } else {
        print('Erro na solicitação: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erro durante a solicitação: $e');
      return false;
    }
  }
}
