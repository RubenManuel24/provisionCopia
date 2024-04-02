import 'package:flutter/material.dart';
import '../../../../models/employee_model.dart';
import '../../../equipment/view/components/row_text_equipment.dart';

class TileObsEmployee extends StatelessWidget {
  EmployeeModel employeeModel;
  TileObsEmployee({
    Key? key,
    required this.employeeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 243, 246, 248),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            RowTextEquipment(text1: "Nome:", text2: employeeModel.name),
            const SizedBox(height: 3),
            RowTextEquipment(
                text1: "Número de trabalhador:",
                text2: employeeModel.employeeNumber),
            const SizedBox(height: 3),
            RowTextEquipment(text1: "Situação:", text2: employeeModel.state),
            const SizedBox(
              height: 6,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Observação",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                        color: Colors.white),
                    height: 200,
                    child: employeeModel.obs.isEmpty ? Center(child: Text("Vazio"),) : ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(employeeModel.obs),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
