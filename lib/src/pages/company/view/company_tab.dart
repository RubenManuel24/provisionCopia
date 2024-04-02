import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../../page_routes/app_pages.dart';
import '../../common_widget/cstom_shimmer_list.dart';
import '../../sites_company/controller/company_sites_controller.dart';
import '../controller/company_controller.dart';
import 'components/tilecard.dart';

class CompanyTab extends StatefulWidget {
  const CompanyTab({super.key});

  @override
  State<CompanyTab> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyTab> {
  final companyController = Get.find<CompanyController>();
  final sitesCompanyController = Get.find<SitesCompanyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: CustomColors.customBlueColor,
        title: const Text(
          "Empresas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Expanded(
                      child: Obx(() => companyController.isLoadingCompany.value
                          ? ListView(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              physics: const BouncingScrollPhysics(),
                              children: [
                                  CustomShimmerList(height: 130),
                                  SizedBox(height: 25),
                                  CustomShimmerList(height: 130),
                                  SizedBox(height: 25),
                                  CustomShimmerList(height: 130),
                                  SizedBox(height: 25),
                                  CustomShimmerList(height: 130),
                                  SizedBox(height: 25),
                                  CustomShimmerList(height: 130),
                                ])
                          : RefreshIndicator(
                            onRefresh: () =>  companyController.getAllCompany(),
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  companyController.listcompanyModel.length,
                              separatorBuilder: (_, index) =>
                                  const SizedBox(height: 3),
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final companyModel =
                                    companyController.listcompanyModel[index];
                                print(companyController
                                    .listcompanyModel[index].name);
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: 130,
                                    width: 200,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          PageRoutes.siteCompanyRoute,
                                          arguments: companyModel,
                                        );
                                      },
                                      child: TileCard(
                                        companyModels: companyModel,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ), 
                           ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
