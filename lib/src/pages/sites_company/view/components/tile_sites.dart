import 'package:flutter/material.dart';

import '../../../../config/custom_colors.dart';
import '../../../../models/company_sites_models.dart';

class TileSite extends StatelessWidget {
  final CompanySitesModels sitesCompanyModels;
  const TileSite({super.key, required this.sitesCompanyModels});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Site:",
                    style: TextStyle(
                        fontSize: 12,
                        color: CustomColors.customBlueColor,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text(
                    sitesCompanyModels.name.length > 35
                        ? '${sitesCompanyModels.name.substring(0, 35)}...'
                        : sitesCompanyModels.name,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text("LocalizaçãO:",
                    style: TextStyle(
                        fontSize: 12,
                        color: CustomColors.customBlueColor,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text(sitesCompanyModels.address,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
