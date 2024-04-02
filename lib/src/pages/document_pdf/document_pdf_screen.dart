import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:share_extend/share_extend.dart';
import '../../config/custom_colors.dart';
import '../history_detalhe/controller/history_detalhes_controller.dart';

class DocumentScreenPdf extends StatefulWidget {
   const DocumentScreenPdf({super.key});

  @override
  State<DocumentScreenPdf> createState() => _DocumentPdfState();
}

class _DocumentPdfState extends State<DocumentScreenPdf> {
   late final String path = Get.arguments;
   final historyDetalhesController = Get.find<HistoryDetalhesController>();

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: CustomColors.customBlueColor,
          title: const Text(
            "Documento",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ),
              iconSize: 30,
              onPressed: () {
                ShareExtend.share(
                  path,
                  "file",
                  sharePanelTitle: "Enviar PDF",
                  subject: "example-pdf",
                );
              },
            ),
          ),
          ],
        ),
           body: Obx(() => historyDetalhesController.pdfLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PDFView(filePath: path),)
       );
  }
}
