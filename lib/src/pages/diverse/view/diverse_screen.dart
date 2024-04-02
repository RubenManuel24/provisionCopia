import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../../services/util_services.dart';
import '../../common_widget/custom_container_regist.dart';
import '../../supervision/controller/supervision_controller.dart';

class DiverseScreen extends StatefulWidget {
  DiverseScreen({super.key});

  @override
  State<DiverseScreen> createState() => _DiverseScreenState();
}

class _DiverseScreenState extends State<DiverseScreen> {
  final supervisorController = Get.find<SupervisionController>();
  UtilServices utilServices = UtilServices();
  TextEditingController textEditingController = TextEditingController();

  Future<bool?> showDialogConfirmMaterialEmployee() {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Confirmar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Tens a certeza que queres confirmar a descrição?",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: CustomColors.customBlueColor,
        title: Column(
          children: [
            Text(
              "Relatório",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
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
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              CustomContainerRegist(height: 400, textEditingController: textEditingController,),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () async {
                    bool? result = await showDialogConfirmMaterialEmployee();

                    if (result ?? false) {
                      supervisorController.relateText = textEditingController.text;
                      textEditingController.clear();
                      Get.back();
                    }
                  },
                  child: Text("OK"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
