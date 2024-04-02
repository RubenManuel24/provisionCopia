import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/user_models.dart';
import '../../../page_routes/app_pages.dart';
import '../../../services/util_services.dart';
import '../repository/auth_repository.dart';
import '../result/auth_result.dart';

class AuthController extends GetxController {
  final authRepository = AuthRespository();
  final utilServices = UtilServices();
  RxBool isLoandig = false.obs;
  UserModel user = UserModel();
  var employeeId;

  Future<void> signIn(
      {required String numberPhone, required String passWord}) async {
    isLoandig.value = true;

    //Validação no Back-End
    AuthResult authResult = await authRepository.signIn(
        numberPhone: numberPhone, passWord: passWord);

    isLoandig.value = !isLoandig.value;

    authResult.when(sucess: (userModel) {
      user = userModel;

      employeeId = userModel.employeeId;
      saveUserIdLocally(employeeId);

      Get.offAllNamed(PageRoutes.baseRoute);
    }, error: (message) {
      utilServices.showToast(text: message, isError: true);
    });
  }

  Future<void> saveUserIdLocally(String? employeeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('employeeId', employeeId!);
  }
}
