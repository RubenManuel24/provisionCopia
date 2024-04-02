// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../config/custom_colors.dart';
import '../../../../models/history_models.dart';
import '../../../../services/util_services.dart';
class TileCardHistory extends StatelessWidget {
  HistoryModels historyModels;
  TileCardHistory({
    Key? key,
    required this.historyModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     UtilServices utilServices = UtilServices();
    return Card(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( "Histórico",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
             Text( utilServices.formatDateTime( DateTime.parse(historyModels.createdAt)),
              
             
              style: TextStyle(
                fontSize: 13,
                color: CustomColors.customBlueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}