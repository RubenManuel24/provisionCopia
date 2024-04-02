import 'dart:math';

import 'package:Provision/src/pages/history/controller/history_controller.dart';
import 'package:Provision/src/pages/sites_company/controller/company_sites_controller.dart';
import 'package:Provision/src/services/util_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/custom_colors.dart';
import '../../../page_routes/app_pages.dart';
import '../../auth/controller/auth_controller.dart';
import '../../base/controller/navigation_controller.dart';
import '../../common_widget/cstom_shimmer_list.dart';
import '../../common_widget/custom_shimmer.dart';
import '../../company/controller/company_controller.dart';
import '../../history_detalhe/controller/history_detalhes_controller.dart';
import '../controller/home_controller.dart';
import 'components/itemTile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final authController = Get.find<AuthController>();
  final homeController = Get.find<HomeController>();
  final historyDetalhesController = Get.find<HistoryDetalhesController>();
  final navigationController = Get.find<NavigationController>();
  final sitesCompanyController = Get.find<SitesCompanyController>();
  final historyController = Get.find<HistoryController>();
  UtilServices utilServices = UtilServices();
  @override
  void initState() {
    historyController.getAllHistory();
    //sitesCompanyController.getAllSitesCompany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: CustomColors.customBlueColor,
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  navigationController.prefs.remove('lat');
                  navigationController.prefs.remove('lng');
                  Get.toNamed(PageRoutes.signingRoute);
                },
                icon: const Icon(Icons.login_outlined))
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                height: 165,
                child: Stack(
                  children: [
                    Positioned(
                      left: 25,
                      top: 45,
                      child: Row(
                        children: [
                          Obx(
                            () => homeController.isLoading.value
                                ? const CustomShimmer(
                                    shapeRectaguler: BoxShape.circle,
                                    height: 115,
                                    width: 115,
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    height: 115,
                                    width: 115,
                                    decoration: BoxDecoration(
                                      color: CustomColors.customOrangeColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 113,
                                      width: 113,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                      child: const CircleAvatar(
                                        radius: 113,
                                        backgroundColor: Colors.grey,
                                        //  backgroundImage:
                                        //   AssetImage(appData.supervisorModels.image),
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Obx(
                            () => Column(
                              children: [
                                homeController.isLoading.value
                                    ? CustomShimmerList(
                                        height: 15,
                                        width: 160,
                                      )
                                    : Text(
                                        authController.user.name ?? " ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                CustomColors.customOrangeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                const SizedBox(
                                  height: 5,
                                ),
                                homeController.isLoading.value
                                    ? CustomShimmerList(
                                        height: 12,
                                        width: 130,
                                      )
                                    : Text(
                                        "Supervisor",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: CustomColors.customBlueColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Obx(
                    () => Align(
                      alignment: Alignment.topLeft,
                      child: homeController.isLoading.value
                          ? CustomShimmerList(
                              height: 15,
                              width: 160,
                            )
                          : const Text("Histórico de supervisão ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => SizedBox(
                      height: 140,
                      child: homeController.isLoading.value
                          ? GridView.count(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              physics: const BouncingScrollPhysics(),
                              crossAxisCount: 1,
                              mainAxisSpacing: 20,
                              children: [
                                  CustomShimmerList(
                                    height: 110,
                                    width: 65,
                                  ),
                                  CustomShimmerList(
                                    height: 110,
                                    width: 65,
                                  ),
                                  CustomShimmerList(
                                    height: 110,
                                    width: 65,
                                  ),
                                ])
                          :  historyController.listHistoryRelatorio.isEmpty
                          ?  Center(
                                child: Text("Vazio"),
                              )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: min(
                                  historyController.listHistoryRelatorio.length,
                                  5),
                              itemBuilder: (context, index) {
                                final reversedIndex = historyController
                                        .listHistoryRelatorio.length -
                                    1 -
                                    index;
                                final historyRelatory = historyController
                                    .listHistoryRelatorio[reversedIndex];
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Card(
                                    elevation: 4.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${utilServices.formatDate(DateTime.parse(historyRelatory.createdAt))}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 18),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 25,
                                                width: 100,
                                                child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Get.toNamed(
                                                      PageRoutes
                                                          .historyDetalheRoute,
                                                    );
                                                    historyDetalhesController
                                                        .getAllSupervisor(
                                                            idSupervision:
                                                                historyRelatory
                                                                    .supervisionId);
                                                  },
                                                  icon: const Icon(
                                                    Icons.description,
                                                    color: Colors.white,
                                                    size: 9,
                                                  ),
                                                  label: const Text(
                                                    'Relatório',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          CustomColors
                                                              .customBlueColor
                                                              .withOpacity(0.5),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50))),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Obx(
                    () => Align(
                      alignment: Alignment.topLeft,
                      child: homeController.isLoading.value
                          ? CustomShimmerList(
                              height: 15,
                              width: 140,
                            )
                          : const Text("Tarefas em validação",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                    ),
                  )),
              Obx(() => Expanded(
                  child: homeController.isLoading.value
                      ? ListView(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          children: [
                              CustomShimmerList(),
                              const SizedBox(height: 7),
                              CustomShimmerList(),
                              const SizedBox(height: 7),
                              CustomShimmerList(),
                              const SizedBox(height: 7),
                              CustomShimmerList(),
                              const SizedBox(height: 7),
                            ])
                      : homeController.listTaskModels.isNotEmpty
                          ? RefreshIndicator(
                              onRefresh: () {
                                return homeController.getAllTask();
                              },
                              child: ListView.builder(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: homeController.listTaskModels.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  // Substitua este widget pelo seu ItemTile ou widget desejado
                                  return ItemTile(
                                    companySitesModels:
                                        homeController.listSiteCompany[index],
                                    taskModels:
                                        homeController.listTaskModels[index],
                                    indexTask: index,
                                  );
                                },
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Center(
                                child: Text("Vazio"),
                              ),
                            )))
            ],
          ),
        ));
  }
}
