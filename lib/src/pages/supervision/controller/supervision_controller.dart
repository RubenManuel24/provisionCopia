import 'dart:async';
import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/employee_model.dart';
import '../../../models/equipment_models.dart';
import '../../../services/util_services.dart';
import '../../auth/controller/auth_controller.dart';
import '../repository/supervision_repository.dart';


class SupervisionController extends GetxController {
  Rx<Duration> _duration = Duration.zero.obs;
  Timer? _timer;
  RxBool active = false.obs;
  Rx<Color> colorIcon = Colors.green.obs;
  Rx<String> textButton = "Iniciar".obs;
  Duration lastDuration = Duration.zero;
  Duration get duration => _duration.value;
  UtilServices utilServices = UtilServices();
  RxBool isLoading = false.obs;
  RxList<EquipmentModels> selectedEquipment = <EquipmentModels>[].obs;
  SupervisionRepository supervisionRepository = SupervisionRepository();
  final authController = Get.find<AuthController>();
  String relateText = " ";
  String? idTask;
  int indexTask = 0;
  int quantEmployeePresent = 0;
  List<EmployeeModel> lisEmployeeModel = [];
  RxString status = "Falta justificada".obs;
  int employeePresent = 0;
  RxBool isOperational = true.obs;
  RxString operationalStatus = "Operacional".obs;
  List<EquipmentModels> listEquipmentModels = [];
  String constCenter = " ";
  String nameSite = " ";
  String textEditingControllerNumber = "";
   final ImagePicker _picker = ImagePicker();
   List<String> selectImagePath =  [];

  @override
  void onInit() {
    var hours = int.parse("00");
    var minutes = int.parse("00");
    var seconds = int.parse("00");
    _duration.value =
        Duration(hours: hours, minutes: minutes, seconds: seconds);
    super.onInit();
  }


  Future<void> sendData({
      required int numberOfWorkers,
      required String costCenterSite,
      required List<EmployeeModel> workerInformation,
      required String report,
      required List<EquipmentModels> equipment,
      required String timer


      }) async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? employeeIdLocalStorege = prefs.getString('employeeId');
      //isLoading.value = true;
    final result = await supervisionRepository.sendData(
      numberOfWorkers: numberOfWorkers,
      costCenter: costCenterSite,
      workerInformation:  lisEmployeeModel.map((employee) => employee.toJson()).toList(),
      report: report,
      equipment: equipment.map((employee) => employee.toJson()).toList(),
      taskId: idTask,
      time: timer,
      employeeId: employeeIdLocalStorege,
    );

     // isLoading.value = false;
      if(result){
          utilServices.showToast(text: "Enviando os dados da Supervisão!");
          idTask = null;
          update();
      }
  }

    
  addEmployee({required String name, required String number,  required String obs, required String state}){

     lisEmployeeModel.add(
      EmployeeModel
      (name: name,
      employeeNumber: number,
      state: state,
      obs: obs
       ));

     update();
   }

    addEquipment({required String name, required String serialNumber, required String obs ,required String state, required String costCenter, required List<String> image }){

     listEquipmentModels.add(
      EquipmentModels(
        name: name,
        serialNumber: serialNumber,
        state: state,
        obs: obs,
        costCenter: costCenter,
        image: image
        ));

     update();
   }

  void setActive(bool activeValor) {
    active.value = activeValor;
    colorIcon.value = activeValor ? Colors.red : Colors.green;
    textButton.value = activeValor ? "Terminar" : "Iniciar";
    update();

    if (activeValor) {
      startTimer();  // Inicie o timer quando active for true
    } else {
      lastDuration = _duration.value;
      _timer?.cancel();
        // Pare o timer quando active for false
    }
  }

   Future<void> scanPhoto() async {
    final XFile? imagePath = await _picker.pickImage(source: ImageSource.camera);
    if (imagePath != null) {
      selectImagePath.add(imagePath.path);
      GallerySaver.saveImage(imagePath.path);
     update();
    }
  }

  void reset() {
    _duration.value = Duration();
  }

  void startTimer() {
    const duration = Duration(seconds: 1);
    _timer?.cancel(); // Cancela o timer existente antes de iniciar um novo
    _timer = Timer.periodic(duration, (_) => addTime());
  }

  void addTime() {
    if (active.value) {
      _duration.value = _duration.value + const Duration(seconds: 1);
      update();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
