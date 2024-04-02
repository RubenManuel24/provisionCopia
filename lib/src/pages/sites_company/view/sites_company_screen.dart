import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../../models/company_model.dart';
import '../../../page_routes/app_pages.dart';
import '../../sites_datails/controller/sites_controller.dart';
import '../controller/company_sites_controller.dart';
import 'components/tile_sites.dart';

class SitesCompanyScreen extends StatefulWidget {
  final CompanyModel companyModel = Get.arguments;

  SitesCompanyScreen();

  @override
  State<SitesCompanyScreen> createState() => _SitesCompanyScreenState();
}

class _SitesCompanyScreenState extends State<SitesCompanyScreen> {
  final ScrollController _scrollController = ScrollController();
  final sitesCompanyController = Get.find<SitesCompanyController>();
  final sitesController = Get.find<SitesController>();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: CustomColors.customBlueColor,
                    ))),
            const SizedBox(height: 5),
            Center(
              child: Image.asset(
                //widget.companyModels.photo,
                "assets/logo/sites.png",
                width: 220,
                height: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Sites",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Divider(
              height: 5,
              thickness: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 3,
            ),
            Expanded(child: GetBuilder<SitesCompanyController>(
                builder: (sitesCompanyController) {
              var sitesDaEmpresa = sitesCompanyController.listCompanySites
                  .where((site) =>
                      site.clientCode == widget.companyModel.clientCode)
                  .toList();

              return ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemCount: sitesDaEmpresa.length,
                separatorBuilder: (_, index) => const SizedBox(height: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () async {
                        sitesCompanyController.constCenterSite =
                            sitesCompanyController
                                .listCompanySites[index].costCenter;
                        sitesController.buttonDesative();
                        Get.toNamed(PageRoutes.supervitionRoute,
                            arguments: sitesDaEmpresa[index]);
                      },
                      child: TileSite(
                        sitesCompanyModels: sitesDaEmpresa[index],
                      ));
                },
              );
            }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Quando o botão flutuante é pressionado, role suavemente para o início da lista
            _scrollController.animateTo(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: CustomColors.customBlueColor,
          child: const Icon(
            Icons.arrow_drop_up_sharp,
            color: Colors.white,
            size: 30,
          )),
    );
  }
}
