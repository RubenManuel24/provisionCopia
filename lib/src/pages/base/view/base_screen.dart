import 'dart:async';
import 'package:Provision/src/pages/occurrence/view/occurrence_tab.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/custom_colors.dart';
import '../../chat/view/chat_tab.dart';
import '../../company/view/company_tab.dart';
import '../../history/controller/history_controller.dart';
import '../../home/view/home_tab.dart';
import '../controller/navigation_controller.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final navigationController = Get.find<NavigationController>();
  final historyController = Get.find<HistoryController>();

  @override
  void initState() {
    _startPositionWatch();
     historyController.getAllHistory();
    super.initState();
  }

  void _startPositionWatch() async {
  while (true) {
    try {
    await Future.delayed(const Duration(minutes: 2));
    print('EXECUÇAO DE 1 MINUTOS');
      await navigationController.watchPosition();
    } catch (e) {
      print('Erro ao Atualizar a Rota: $e');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: navigationController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [HomeTab(), CompanyTab(), ChatTab(), OccurrenceTab()],
      ),
      bottomNavigationBar: Obx(
        () => ConvexAppBar(
          initialActiveIndex: navigationController.currentIndex,
          onTap: (index) {
            navigationController.naviationPageView(index);
            navigationController.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceIn,
            );
          },
          backgroundColor: CustomColors.customOrangeColor,
          activeColor: Colors.white,
          items: const [
            TabItem(icon: Icons.home_outlined, title: "Home"),
            TabItem(icon: Icons.home_work_outlined, title: "Empresa"),
            TabItem(icon: Icons.chat_outlined, title: "Chat"),
            TabItem(icon: Icons.warning_outlined, title: "Ocorrência"),
          ],
        ),
      ),
    );
  }
}
