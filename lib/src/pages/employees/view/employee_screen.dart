import 'package:Provision/src/models/task_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import '../../../config/custom_colors.dart';
import '../../../page_routes/app_pages.dart';
import '../../../services/util_services.dart';
import '../../supervision/controller/supervision_controller.dart';
import 'components/tile_obs_employee.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<EmployeeScreen> {
  final supervisorController = Get.find<SupervisionController>();
  UtilServices utilServices = UtilServices();
  TextEditingController textEditingControllerPresent = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<bool?> showDialogConfirmMaterialEmployee() {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Confirmar?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Deseja realmente terminar a supervisão no pessoal?",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 3,
              ),
            ],
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
              "Pessoal",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 12),
                        Column(
                          children: [
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Text("Presente",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 70,
                              child: Expanded(
                                  child: TextFormField(
                                validator: Validatorless.multiple([
                                  Validatorless.required(' '),
                                ]),
                                keyboardType: TextInputType.number,
                                controller: textEditingControllerPresent,
                                textAlign: TextAlign.center,
                                showCursor: true,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  label: Text(
                                    "Digite número",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey.shade800),
                                  ),
                                  isDense: false,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Text("Pretendido",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 70,
                              child: Expanded(
                                  child: TextFormField(
                                textAlign: TextAlign.center,
                                readOnly: true,
                                initialValue: supervisorController
                                    .quantEmployeePresent
                                    .toString(),
                                showCursor: true,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  isDense: false,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                              )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 5,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  GetBuilder<SupervisionController>(
                      builder: (employeesController) {
                    return Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Pessoal ausente no site",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 15, right: 15),
                            child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                height: 250,
                                child: supervisorController
                                        .lisEmployeeModel.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        child: ListView.separated(
                                            separatorBuilder: (context, index) =>
                                                const SizedBox(height: 3),
                                            itemBuilder: (context, index) {
                                              final employees =
                                                  supervisorController
                                                      .lisEmployeeModel[index];
                                              return TileObsEmployee(
                                                  employeeModel: employees);
                                            },
                                            itemCount: supervisorController
                                                .lisEmployeeModel.length),
                                      )
                                    : const Center(child: Text("Vazio!")))),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("Quantidade de pessoal em falta:",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                                supervisorController.lisEmployeeModel.length
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: CustomColors.customBlueColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          height: 5,
                          thickness: 2,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Criar observação para um determinado funcionário:",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        ElevatedButton.icon(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.customBlueColor),
                            onPressed: () =>
                                Get.toNamed(PageRoutes.employee_registerRoute),
                            label: const Text(
                              "Criar",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () async {
                        final valid = formKey.currentState!.validate() ?? false;

                        if(valid){
                           bool? result = await showDialogConfirmMaterialEmployee();
              
                        if (result ?? false) {
                          supervisorController.employeePresent =
                              int.parse(textEditingControllerPresent.text);
                          textEditingControllerPresent.clear();
                          Get.back();
                        }
                        }
                      },
                      child: const Text(
                        "Enviar",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
