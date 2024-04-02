import 'package:Provision/src/pages/occurrence/controller/occurrence_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl_standalone.dart';
import 'package:validatorless/validatorless.dart';
import '../../../config/custom_colors.dart';
import '../../base/controller/navigation_controller.dart';
import '../../common_widget/custom_container_regist.dart';
import '../../common_widget/text_field_register.dart';

class OccurrenceTab extends StatefulWidget {
  const OccurrenceTab({super.key});

  @override
  State<OccurrenceTab> createState() => _OccurrenceTabState();
}

class _OccurrenceTabState extends State<OccurrenceTab> {
  TextEditingController textEditingControllertTitle = TextEditingController();
  TextEditingController textEditingControllerDescription =
      TextEditingController();
  TextEditingController textEditingControllerCostCenter =
      TextEditingController();
  final occurencecontroller = Get.find<OccurenceController>();
  final navigationController = Get.find<NavigationController>();
  final formKey = GlobalKey<FormState>();

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
    print("Valor do RADIO: ${occurencecontroller.status.value}");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: CustomColors.customBlueColor,
        title: const Text(
          "Ocorrência",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Título:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFieldRegister(
                      validator: Validatorless.multiple([
                                  Validatorless.required('Digite o título'),
                                ]),
                      textEditingController: textEditingControllertTitle,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Centro de custo:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFieldRegister(
                      validator:  Validatorless.multiple([
                                  Validatorless.required('Digite o centro de custo'),
                                ]),
                      textEditingController: textEditingControllerCostCenter,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Descrição:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomContainerRegist(
                      height: 200,
                      textEditingController: textEditingControllerDescription,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Prioridade:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Column(
                      children: [
                        buildRadio("Máxima", Colors.red, 0),
                        buildRadio("Mínima", Colors.orange, 1),
                        buildRadio("Baixa", Colors.green, 2),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 10,
                  bottom: 28,
                  child: FloatingActionButton(
                    onPressed: () async {
                      final valid = formKey.currentState!.validate() ?? false;
                      if (valid) {
                        FocusScope.of(context).unfocus();

                        bool? result;

                        result = await showDialogConfirm(
                            "Tens a certeza que os dados estão corretos?");

                        if (result ?? false) {
                          occurencecontroller.sendOccurence(
                            name: textEditingControllertTitle.text,
                            details: textEditingControllerDescription.text,
                            priority: occurencecontroller.status.value,
                            lat: navigationController.currentPosition!.latitude,
                            long:
                                navigationController.currentPosition!.longitude,
                            consterCenter: textEditingControllerCostCenter.text,
                          );
                          textEditingControllertTitle.clear();
                          textEditingControllerDescription.clear();
                          textEditingControllerCostCenter.clear();
                        }
                      }
                    },
                    child: const Text("OK"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadio(String label, Color color, int value) {
    return Row(
      children: [
        Obx(() {
          print("Valor do RADIO: ${occurencecontroller.status.value}");
          return Radio(
            activeColor: CustomColors.customBlueColor,
            value: value,
            groupValue: occurencecontroller.status.value,
            onChanged: (int? selectedValue) {
              if (selectedValue != null) {
                occurencecontroller.status.value = selectedValue;
              }
            },
          );
        }),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: color,
          ),
        ),
      ],
    );
  }
}
