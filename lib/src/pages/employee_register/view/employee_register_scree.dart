import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../../services/util_services.dart';
import '../../../services/validators.dart';
import '../../common_widget/custom_container_regist.dart';
import '../../common_widget/text_field_register.dart';
import '../../supervision/controller/supervision_controller.dart';

class EmployeeRegisterScreen extends StatefulWidget {
  const EmployeeRegisterScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeRegisterScreen> createState() => _EmployeeRegisterScreenState();
}

class _EmployeeRegisterScreenState extends State<EmployeeRegisterScreen> {
  final supervisorController = Get.find<SupervisionController>();
  UtilServices utilServices = UtilServices();
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerNumber = TextEditingController();
  TextEditingController textEditingControllerObs = TextEditingController();
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
              "Observação",
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
                const Text("Mecanográfico do Trabalhador:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                TextFieldRegister(
                  validator: numberEmployeeValidator,
                  textEditingController: textEditingControllerNumber,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Nome",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                TextFieldRegister(
                  validator: nameValidator,
                  textEditingController: textEditingControllerName,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Estado:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Column(
                  children: [
                    buildRadio("Falta justificada"),
                    buildRadio("Falta não justificada"),
                    buildRadio("Abandono"),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Observação",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 7,
                ),
                CustomContainerRegist(height: 150, textEditingController: textEditingControllerObs,),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        bool? result;

                        result = await showDialogConfirm(
                            "Tens a certeza que os dados estão corretos?");

                        if (result ?? false) {
                          supervisorController.addEmployee(
                              name: textEditingControllerName.text,
                              number: textEditingControllerNumber.text,
                              state: supervisorController.status.value,
                              obs: textEditingControllerObs.text
                              );

                          textEditingControllerName.clear();
                          textEditingControllerNumber.clear();
                          Get.back();
                        }
                      }
                    },
                    child: const Text("OK"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadio(String label) {
    return Row(
      children: [
        Obx(() => Radio(
              activeColor: CustomColors.customBlueColor,
              value: label,
              groupValue: supervisorController.status.value,
              onChanged: (value) {
                supervisorController.status.value = value as String;
              },
            )),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
