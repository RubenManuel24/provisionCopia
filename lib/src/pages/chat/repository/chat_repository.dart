import '../../../constants/end_points.dart';
import '../../../models/message_model.dart';
import '../../../services/http_manager.dart';
import '../../auth/repository/auth_error.dart';
import '../result/chat_result.dart';

class ChatRepository {
  HttpManager _httpManager = HttpManager();
  String sizePage = "?size=500";

  Future<bool> sendMessage(
      String userId, String mecCoordinator, String message) async {
    final result = await _httpManager.resRequest(
        urlEndPoint: Endpoints.sendMessage + userId + "/" + mecCoordinator,
        method: HttpMethods.post,
        body: {"message": message});

    if (result["status"] == 201) {
      print('Resposta: ${result}');
      return true;
    } else {
      print('Resposta: ${result}');
      return false;
    }
  }

  Future<ChatResult<List<MessageModel>>> getAllMessageUser(
      String userId, String mecCoordinator) async {
    final result = await _httpManager.resRequest(
        urlEndPoint: Endpoints.getAllMessage +
            userId +
            "/" +
            mecCoordinator +
            "/" +
            sizePage,
        method: HttpMethods.get);

    if (result != null &&
        result["data"] != null &&
        result["data"]["data"] != null) {
      final List<MessageModel> message =
          List<Map<String, dynamic>>.from(result["data"]["data"])
              .map((e) => MessageModel.fromMap(e))
              .toList();

      return ChatResult<List<MessageModel>>.sucess(message);
    } else {
      return ChatResult.error("Messagens não carregadas");
    }
  }

  Future<ChatResult<List<MessageModel>>> getAllMessageGestor(
      String mecCoordinator, String userId) async {
    final result = await _httpManager.resRequest(
        urlEndPoint: Endpoints.getAllMessage +
            mecCoordinator +
            "/" +
            userId +
            "/" +
            sizePage,
        method: HttpMethods.get);

    if (result != null &&
        result["data"] != null &&
        result["data"]["data"] != null) {
      final List<MessageModel> message =
          List<Map<String, dynamic>>.from(result["data"]["data"])
              .map((e) => MessageModel.fromMap(e))
              .toList();

      return ChatResult<List<MessageModel>>.sucess(message);
    } else {
      return ChatResult.error("Messagens não carregadas");
    }
  }
}
