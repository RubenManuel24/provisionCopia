import 'package:Provision/src/pages/common_widget/custom_container_regist.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../main.dart';
import '../../../config/custom_colors.dart';
import '../../../models/company_sites_models.dart';
import '../../../services/util_services.dart';
import '../../../services/validators.dart';
import '../../common_widget/text_field_register.dart';
import '../../supervision/controller/supervision_controller.dart';

class RegisteringEquipmentScreen extends StatefulWidget {
  final CompanySitesModels companySitesModels = Get.arguments;
   RegisteringEquipmentScreen({super.key});

  @override
  State<RegisteringEquipmentScreen> createState() =>
      _RegisteringEquipmentScreenState();
}

class _RegisteringEquipmentScreenState
    extends State<RegisteringEquipmentScreen> {
  final supervisorController = Get.find<SupervisionController>();
  UtilServices utilServices = UtilServices();
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerNumber = TextEditingController();
  TextEditingController textEditingControllerObs = TextEditingController();
  late CameraController cameraController;

  final _formKey = GlobalKey<FormState>();

  Future<bool?> showDialogConfirm(String confirmation) {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Confirmação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            confirmation,
            style: const TextStyle(fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "Não",
                style: TextStyle(color: CustomColors.customBlueColor),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.customBlueColor),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                "Sim",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: CustomColors.customBlueColor,
        title: Column(
          children: [
            const Text(
              "Registrar Equipamento",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Obx(
              () => Text(
                utilServices.getTimeString(supervisorController.duration),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Nome:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                TextFieldRegister(
                  validator: nameEquipmentValidator,
                  textEditingController: textEditingControllerName,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Número de série:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(
                  height: 7,
                ),
                TextFieldRegister(
                  validator: numberSerieValidator,
                  textEditingController: textEditingControllerNumber,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Centro custo:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(
                  height: 7,
                ),
                TextFieldRegister(
                  validator: numberCenterValidator,
                  initialValue: widget.companySitesModels.costCenter,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Estado:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(
                  height: 7,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio(
                              activeColor: CustomColors.customBlueColor,
                              value: true,
                              groupValue:
                                  supervisorController.isOperational.value,
                              onChanged: (value) {
                                supervisorController.isOperational.value =
                                    value as bool;
                                supervisorController.operationalStatus.value =
                                    supervisorController.isOperational.value
                                        ? "Operacional"
                                        : "Inoperacional";
                              },
                            )),
                        const Text(
                          "Operacional",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Obx(() => Radio(
                              activeColor: CustomColors.customBlueColor,
                              value: false,
                              groupValue:
                                  supervisorController.isOperational.value,
                              onChanged: (value) {
                                supervisorController.isOperational.value =
                                    value as bool;
                                supervisorController.operationalStatus.value =
                                    supervisorController.isOperational.value
                                        ? "Operacional"
                                        : "Inoperacional";
                              },
                            )),
                        const Text(
                          "Inoperacional",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                 const Text("Observação:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(
                  height: 7,
                ),
                 CustomContainerRegist(height: 150, textEditingController: textEditingControllerObs),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                       InkWell(
                        onTap: () {
                          supervisorController.scanPhoto();
                        },
                         child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: CustomColors.customBlueColor,
                            borderRadius: BorderRadius.circular(16)
                          ) ,
                          child:  Icon(Icons.camera_alt_outlined, color: Colors.grey.shade200,)),
                       ),
                      Expanded(child: Container()),
                      FloatingActionButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        bool? result;

                        result = await showDialogConfirm(
                            "Tens a certeza que os dados estão corretos?");

                        if (result ?? false) {
                          supervisorController.addEquipment(
                              name: textEditingControllerName.text,
                              serialNumber: textEditingControllerNumber.text,
                              state: supervisorController.operationalStatus.value,
                              costCenter: widget.companySitesModels.costCenter,
                              obs: textEditingControllerObs.text, 
                              image: supervisorController.selectImagePath,
                              );
                          
                           supervisorController.textEditingControllerNumber = textEditingControllerNumber.text;

                          textEditingControllerName.clear();
                          textEditingControllerNumber.clear();
                          Get.back();
                        }
                      }
                    },
                    child: const Text("OK"),
                  ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
