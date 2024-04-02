import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../config/custom_colors.dart';
import '../../page_routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _InicialPageState();
}

class _InicialPageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.toNamed(PageRoutes.signingRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Column(
              children: [
                Image.asset(
                  "assets/logo/logo.png",
                  width: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                LoadingAnimationWidget.prograssiveDots(
                  color: CustomColors.customBlueColor,
                  size: 50,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
