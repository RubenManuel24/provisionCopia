import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../config/custom_colors.dart';
import '../../../services/validators.dart';
import '../../common_widget/custom_text_field.dart';
import '../controller/auth_controller.dart';

class SiginScreen extends StatefulWidget {
  SiginScreen({
    super.key,
  });

  @override
  State<SiginScreen> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  final telController = TextEditingController(text: "941575885");
  final passwordController = TextEditingController(text: "12345678");

  final tlfmaskFormatter = MaskTextInputFormatter(
      mask: '#########', filter: {"#": RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();

  final authController = Get.find<AuthController>();

  Future<void> permissionActual() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
    // Permissão concedida, prossiga com o login
    return;
  } else if (status.isDenied) {
    // Permissão negada pelo usuário
    print('Permissão de localização negada pelo usuário');
  } else if (status.isPermanentlyDenied) {
    // Permissão negada permanentemente, o usuário precisa habilitá-la manualmente nas configurações do dispositivo
    print('Permissão de localização negada permanentemente');
  }
}
 @override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Scaffold(
    backgroundColor: Colors.white,
    body: buildSignInForm(size),
  );
}

Widget buildSignInForm(Size size) {
  return SingleChildScrollView(
    child: SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
              child: Image.asset(
                "assets/logo/logo.png",
                width: 100,
              ),
            ),
          ),
          SizedBox(height: 80),
          Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    textInputType: TextInputType.phone,
                    controller: telController,
                    icon: Icons.phone,
                    label: 'Telefone',
                    validator: phoneValidator,
                    textInputFormatter: [tlfmaskFormatter],
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: passwordController,
                    isSecret: true,
                    icon: Icons.lock,
                    label: 'Senha',
                    validator: passWordValidator,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: authController.isLoandig.value
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  // Solicitar permissão de localização
                                  await permissionActual();
                                  String numberPhone = telController.text;
                                  String passWord = passwordController.text;
                                  authController.signIn(
                                    numberPhone: numberPhone,
                                    passWord: passWord,
                                  );
                                } else {
                                  print("Os dados não passaram!");
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: CustomColors.customOrangeColor,
                        ),
                        child: authController.isLoandig.value
                            ? const CircularProgressIndicator(
                                color: Color(0xFF0C6CC7),
                                backgroundColor: Color(0xFFF58634),
                              )
                            : Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


}
