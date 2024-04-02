import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/util_services.dart';
import '../../controller/supervision_controller.dart';

// ignore: must_be_immutable
class BuildTimeCard extends StatelessWidget {
  final SupervisionController supervisorController = Get.find<SupervisionController>();

  BuildTimeCard({Key? key}) : super(key: key);

  UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              utilServices.getTimeString(Get.find<SupervisionController>().duration),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 