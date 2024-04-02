// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../models/company_model.dart';
import '../../../sites_company/view/sites_company_screen.dart';

class TileCard extends StatelessWidget {
  CompanyModel companyModels;
  TileCard({
    Key? key,
    required this.companyModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 16),
        child: Row(
          children: [
            Image.asset(
              //companyModels.photo,
              "assets/logo/sites.png",
              width: 80,
              height: 60,
            ),
            SizedBox(width: 6),
            Text(
              companyModels.name.length > 25
                  ? '${companyModels.name.substring(0, 25)}...'
                  : companyModels.name,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
