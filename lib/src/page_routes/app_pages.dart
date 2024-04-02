// ignore_for_file: prefer_const_constructors

import 'package:Provision/src/pages/document_pdf/document_pdf_screen.dart';
import 'package:Provision/src/pages/occurrence/view/occurrence_tab.dart';
import 'package:get/get.dart';
import '../pages/auth/view/sigin_screen.dart';
import '../pages/base/binding/navigation_tab_binding.dart';
import '../pages/base/view/base_screen.dart';
import '../pages/chat/binding/chat_binding.dart';
import '../pages/chat/view/chat_tab.dart';
import '../pages/company/binding/company_binding.dart';
import '../pages/diverse/view/diverse_screen.dart';
import '../pages/employee_register/view/employee_register_scree.dart';
import '../pages/employees/view/employee_screen.dart';
import '../pages/equipment/view/equipment_screen.dart';
import '../pages/history/binding/history_binding.dart';
import '../pages/history/view/history_screen.dart';
import '../pages/history_detalhe/binding/history_detalhe.dart';
import '../pages/history_detalhe/view/history_detalhe_screen.dart';
import '../pages/home/binding/home_binding.dart';
import '../pages/occurrence/binding/occurrence_bindings.dart';
import '../pages/registering_equipment/view/registering_equipment_screen.dart';
import '../pages/sites_company/binding/sites_company_binding.dart';
import '../pages/sites_company/view/sites_company_screen.dart';
import '../pages/sites_datails/binding/SitesDatails.dart';
import '../pages/sites_datails/view/sites_details_screen.dart';
import '../pages/splashScreen/splash_screen.dart';
import '../pages/supervision/binding/supervision_binding.dart';
import '../pages/supervision/view/supervision_screen1.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PageRoutes.splashRoute, page: () => const SplashScreen()),
    GetPage(name: PageRoutes.signingRoute, page: () => SiginScreen()),
    GetPage(
        name: PageRoutes.baseRoute,
        page: () => const BaseScreen(),
        bindings: [
          NavigationTabBinding(),
          SitesCompanyBinding(),
          CompanyBinding(),
          HomeBinding(),
          SitesDatailsBinding(),
          SupervisionBindig(),
          HistoryBinding(),
          CompanyBinding(),
          ChatBinding(),
          OcurrenceBinding(),
          HistoryDetalheBinding()
        ]),
    GetPage(name: PageRoutes.chatRoute, page: () => const ChatTab()),
    GetPage(
        name: PageRoutes.certificadoRoute, page: () => const OccurrenceTab()),
    GetPage(
      name: PageRoutes.siteCompanyRoute,
      page: () => SitesCompanyScreen(),
    ),
    GetPage(
      name: PageRoutes.supervisorRoute,
      page: () => SupervisionScreen1(),
      ),
    GetPage(
      name: PageRoutes.supervitionRoute,
      page: () => SupervisionScreen1(),
    ),
    GetPage(name: PageRoutes.sitesDatails, page: () => SitesDetailsScren()),
    GetPage(name: PageRoutes.equipmentRoute, page: () => EquipmentScreen()),
    GetPage(
      name: PageRoutes.employeeRoute,
      page: () => EmployeeScreen(),
    ),
    GetPage(name: PageRoutes.diverseRoute, page: () => DiverseScreen()),
    GetPage(
        name: PageRoutes.historyRoute,
        page: () => HistoryScreen()),
    GetPage(
      name: PageRoutes.historyDetalheRoute,
      page: () => HistoryDetalheScreen(),
    ),
    GetPage(
        name: PageRoutes.registeringEquipmentRoute,
        page: () => RegisteringEquipmentScreen()),
    GetPage(
        name: PageRoutes.employee_registerRoute,
        page: () => const EmployeeRegisterScreen()),

    GetPage(
        name: PageRoutes.documentRoute,
        page: () => const DocumentScreenPdf()),

      GetPage(
        name: PageRoutes.registeringEquipmentRoute,
        page: () => RegisteringEquipmentScreen()),
  ];
}

abstract class PageRoutes {
  static const String splashRoute = "/splash";
  static const String documentRoute = "/document";
  static const String signingRoute = "/signing";
  static const String baseRoute = "/base";
  static const String chatRoute = "/chat";
  static const String certificadoRoute = "/certificado";
  static const String certificadoZoomRoute = "/certificadoZoom";
  static const String supervisorRoute = "/supervisor";
  static const String taskRoute = "/tarefa";
  static const String siteCompanyRoute = "/siteCompany";
  static const String supervitionRoute = "/supervition";
  static const String employeeRoute = "/employee";
  static const String sitesDatails = "/sitesDatails";
  static const String equipmentRoute = "/equipment";
  static const String locationRoute = "/location";
  static const String diverseRoute = "/diverse";
  static const String historyRoute = "/history";
  static const String historyDetalheRoute = "/historyDetalhe";
  static const String registeringEquipmentRoute = "/registeringEquipment";
  static const String employee_registerRoute = "/employee_register";
}
