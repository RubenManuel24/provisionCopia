import '../../../constants/end_points.dart';
import '../../../services/http_manager.dart';
import 'auth_error.dart' as authErros;
import '../../../models/user_models.dart';
import '../result/auth_result.dart';

class AuthRespository{
  HttpManager _httpManager = HttpManager();

  Future<AuthResult> signIn({required String numberPhone, required passWord}) async {

    final result = await _httpManager.resRequest(
      urlEndPoint: Endpoints.signin, 
      method: HttpMethods.post,
      body: {"number": numberPhone.toString(), "password": passWord.toString()},
      );

   if (result != null && result["data"] != null && result["data"]["data"] != null) {
  final UserModel user = UserModel.fromMap(result["data"]["data"]);
   
  return AuthResult.sucess(user);
} else {
  return AuthResult.error(authErros.authErrosString(result?["data"]?["status"]));
}
  }
}