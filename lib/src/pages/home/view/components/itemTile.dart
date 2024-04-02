import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/custom_colors.dart';
import '../../../../models/company_sites_models.dart';
import '../../../../models/task_models.dart';
import '../../../../page_routes/app_pages.dart';
import '../../../sites_company/controller/company_sites_controller.dart';
import '../../../supervision/controller/supervision_controller.dart';

class ItemTile extends StatefulWidget {
  final CompanySitesModels companySitesModels;
  final TaskModels taskModels;
  final int indexTask;
  ItemTile({
    Key? key,
    required this.companySitesModels,
    required this.taskModels,
    required this.indexTask
  }) : super(key: key);

  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  
  final sitesCompanyController = Get.find<SitesCompanyController>();
  final supervisionController = Get.find<SupervisionController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
         
        supervisionController.idTask = widget.taskModels.id;
        supervisionController.quantEmployeePresent = widget .taskModels.desiredNumber;
        sitesCompanyController.constCenterSite = widget.companySitesModels.costCenter;
        supervisionController.indexTask = widget.indexTask;
        

        Get.toNamed(
          PageRoutes.supervitionRoute,
          arguments: widget.companySitesModels,
        );
      },
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey.shade300,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      "assets/icons/tarefa.png",
                      color: CustomColors.customBlueColor,
                    )),
                    SizedBox(width: 3,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start, 
                  children: [
                  SizedBox(height: 3,),
                  Text(
                    widget.companySitesModels.name,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ])
              ]),
        ),
      ),
    );
  }
}
