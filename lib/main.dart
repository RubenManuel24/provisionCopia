import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'src/config/custom_colors.dart';
import 'src/page_routes/app_pages.dart';
import 'src/pages/auth/controller/auth_controller.dart';
import 'src/pages/splashScreen/splash_screen.dart';

late List<CameraDescription> cameras;

void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Get.put(AuthController());
  //Código para o app estar somente numa orientacao de tela
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MaterialApp(
      home: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provision',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: CustomColors.customBlueColor),
        scaffoldBackgroundColor: Colors.grey.shade200,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      initialRoute: PageRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
