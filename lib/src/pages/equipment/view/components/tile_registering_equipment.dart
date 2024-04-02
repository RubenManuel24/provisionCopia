import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../models/equipment_models.dart';
import 'row_text_equipment.dart';

class TileRegisteringEquipment extends StatelessWidget {
  EquipmentModels equipmentModels;
  TileRegisteringEquipment({
    Key? key,
    required this.equipmentModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isColor;

    if(equipmentModels.state == "Operacional"){
      isColor = true;
    } else if(equipmentModels.state == "Inoperacional"){
      isColor = false;
    } else{
      isColor = null;
    }


    return Card(
      color: const Color.fromARGB(255, 243, 246, 248),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            RowTextEquipment(text1: "Nome:", text2: equipmentModels.name),
            const SizedBox(height: 3),
            RowTextEquipment(
                text1: "Número de série:", text2: equipmentModels.serialNumber),
            const SizedBox(height: 3),
            RowTextEquipment(text1: "Centro:", text2: equipmentModels.costCenter),
            const SizedBox(height: 3),
            RowTextEquipment(text1: "Estado:", text2: equipmentModels.state, isColor: isColor,),
            const SizedBox(
              height: 6,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Imagem do equipamento",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
             Padding(
               padding: const EdgeInsets.all(5),
               child:  equipmentModels.image!.isEmpty ? Center(child: Text("Sem imagem"),) : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                 itemCount: equipmentModels.image!.length,
                itemBuilder: (context, index){
                  var image =  equipmentModels.image![index];
                  return Image.file(File(image), fit: BoxFit.cover,width: 300, height: 300);
                }, 
                separatorBuilder:(context,int) => const SizedBox(height: 4),
               )
             ),
            const SizedBox(
              height: 10,
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
                    child: equipmentModels.obs.isEmpty ? const Center(child: Text("Vazio"),) : ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(equipmentModels.obs),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
