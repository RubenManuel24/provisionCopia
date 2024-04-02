import 'dart:io';

import 'package:Provision/src/pages/supervision/controller/supervision_controller.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../../../models/supervision_model.dart';
import '../../../page_routes/app_pages.dart';
import '../../../services/util_services.dart';
import '../../auth/controller/auth_controller.dart';
import '../repository/history_detalhe_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class HistoryDetalhesController extends GetxController {
  HistoryDetalheRepository historyDetalheRepository =
      HistoryDetalheRepository();
  UtilServices utilServices = UtilServices();
  final authController = Get.find<AuthController>();
  final supervisionController = Get.find<SupervisionController>();
  SuperVisionModel superVisionModel = SuperVisionModel();
  RxBool isLoadingSupervision = true.obs;
  int quantEquipment = 0;
  RxBool pdfLoading = true.obs;
  late PDFDocument doc;

  Future<void> getAllSupervisor({required String idSupervision}) async {
    isLoadingSupervision.value = true;
    final result = await historyDetalheRepository.getAllSupervisor(
        idSupervision: idSupervision);
    result.when(sucess: (result) {
      isLoadingSupervision.value = false;
      superVisionModel = result;
      quantEquipment = superVisionModel.equipment!.length;
      update();
    }, error: (message) {
      utilServices.showToast(text: message);
    });
  }

  Future<void> createPDF(SuperVisionModel superVisionModel) async {
    int micros = DateTime.now().microsecondsSinceEpoch;

    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    final ByteData data = await rootBundle.load('assets/logo/logo.png');
    final Uint8List bytes = data.buffer.asUint8List();

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/${micros}.pdf';
    final File file = File(path);

     try{ pdf.addPage(
      pdfLib.MultiPage(
        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pdfLib.Align(
            alignment: pdfLib.Alignment.topCenter,
            child: pdfLib.Image(pdfLib.MemoryImage(bytes), width: 80),
          ),
          pdfLib.SizedBox(height: 20),
          pdfLib.Align(
            alignment: pdfLib.Alignment.topCenter,
            child: pdfLib.Text('RELATÓRIO DA SUPERVISÃO',
                style: pdfLib.TextStyle(
                    fontSize: 16, fontWeight: pdfLib.FontWeight.bold)),
          ),
          pdfLib.SizedBox(height: 20),
          pdfLib.Align(
            alignment: pdfLib.Alignment.topCenter,
            child: pdfLib.Text('Identificação',
                style: pdfLib.TextStyle(
                    fontSize: 16, fontWeight: pdfLib.FontWeight.bold)),
          ),
          pdfLib.SizedBox(height: 20),
          pdfLib.Text('Site: ${supervisionController.nameSite}'),
          pdfLib.SizedBox(height: 4),
          pdfLib.Text(
              'Data: ${utilServices.formatDate(DateTime.parse(superVisionModel.createAt.toString()))}'),
          pdfLib.SizedBox(height: 4),
          pdfLib.Text('Supervisor: ${authController.user.name}'),
          pdfLib.SizedBox(height: 4),
          pdfLib.Text('Mec do supervisor: ${superVisionModel.supervisorCode}'),
          pdfLib.SizedBox(height: 4),
          pdfLib.Text('Centro de custo: ${superVisionModel.costCenter}'),
          pdfLib.SizedBox(height: 4),
          pdfLib.Text(
              'Tempo de execução: ${utilServices.formatTime(superVisionModel.time.toString())}'),
          pdfLib.SizedBox(height: 10),
          pdfLib.Divider(color: PdfColors.black, height: 4),
          pdfLib.SizedBox(height: 10),
          pdfLib.Align(
            alignment: pdfLib.Alignment.topCenter,
            child: pdfLib.Text('Pessoal',
                style: pdfLib.TextStyle(
                    fontSize: 16, fontWeight: pdfLib.FontWeight.bold)),
          ),
          pdfLib.SizedBox(height: 20),
          pdfLib.Text(
              'Número de pessaol pretendido: ${superVisionModel.desiredNumber}'),
          pdfLib.SizedBox(height: 4),
          pdfLib.Text(
              'Número de pessaol encontrado: ${superVisionModel.numberOfWorkers}'),
          pdfLib.SizedBox(height: 10),
          pdfLib.Text('Informações do pessoal não encontrado no site',
              style: pdfLib.TextStyle(
                  fontSize: 12, fontWeight: pdfLib.FontWeight.bold)),
          pdfLib.SizedBox(height: 15),
          superVisionModel.workerInformation!.isEmpty
              ? pdfLib.Center(
                  child: pdfLib.Text(" Sem informações do pessoal"),
                )
              : pdfLib.ListView.separated(
                  itemCount: superVisionModel.workerInformation!.length,
                  separatorBuilder: (context, int index) => pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.symmetric(vertical: 7),
                      child: pdfLib.Divider(color: PdfColors.grey)),
                  itemBuilder: (context, int index) {
                    final workerInformation =
                        superVisionModel.workerInformation![index];
                    return pdfLib.Column(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                        children: [
                          pdfLib.Text('Nome: ${workerInformation.name}'),
                          pdfLib.SizedBox(height: 4),
                          pdfLib.Text(
                              'Número do trabalhador: ${workerInformation.employeeNumber}'),
                          pdfLib.SizedBox(height: 4),
                          pdfLib.Text('Situação: ${workerInformation.state}'),
                          pdfLib.SizedBox(height: 4),
                          pdfLib.RichText(
                            softWrap: true, textAlign: pdfLib.TextAlign.justify,
                            text:  pdfLib.TextSpan(
                              children: [
                                pdfLib.TextSpan(
                                  children: [
                                      pdfLib.TextSpan(
                                  text: 'Observasão: ',
                                  style:
                                      pdfLib.TextStyle(color: PdfColors.black,  fontWeight: pdfLib.FontWeight.bold),
                                ),
                                  ],
                                ),

                                 pdfLib.TextSpan(
                                  children: [
                                      pdfLib.TextSpan(
                                  text: workerInformation.obs,
                                  style:
                                      pdfLib.TextStyle(color: PdfColors.black),
                                ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]);
                  },
                ),
          pdfLib.SizedBox(height: 10),
          pdfLib.Divider(color: PdfColors.black, height: 4),
          pdfLib.SizedBox(height: 10),
          pdfLib.Align(
            alignment: pdfLib.Alignment.topCenter,
            child: pdfLib.Text('Equipamento',
                style: pdfLib.TextStyle(
                    fontSize: 16, fontWeight: pdfLib.FontWeight.bold)),
          ),
          pdfLib.SizedBox(height: 20),
          pdfLib.Text(
              'Número de equipamentos presente no site: ${superVisionModel.equipment!.length}'),
          pdfLib.SizedBox(height: 10),
          pdfLib.Text('Informações dos equipamentos encontrado no site',
              style: pdfLib.TextStyle(
                  fontSize: 12, fontWeight: pdfLib.FontWeight.bold)),
          pdfLib.SizedBox(height: 15),
          superVisionModel.workerInformation!.isEmpty
              ? pdfLib.Center(
                  child: pdfLib.Text("Sem informações dos equipamentos"),
                )
              : pdfLib.ListView.separated(
                  itemCount: superVisionModel.equipment!.length,
                  separatorBuilder: (context, int index) => pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.symmetric(vertical: 7),
                      child: pdfLib.Divider(color: PdfColors.grey)),
                  itemBuilder: (context, int index) {
                    final equipment = superVisionModel.equipment![index];
                    return pdfLib.Align(alignment: pdfLib.Alignment.topLeft,
                     child: pdfLib.Column(
                         mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                        children: [
                          pdfLib.Text('Nome: ${equipment.name}'),
                          pdfLib.SizedBox(height: 4),
                          pdfLib.Text(
                              'Número de série: ${equipment.serialNumber}'),
                          pdfLib.SizedBox(height: 4),
                          pdfLib.Text('Estado: ${equipment.state}'),
                          pdfLib.SizedBox(height: 4),


                              pdfLib.RichText(
                            softWrap: true, textAlign: pdfLib.TextAlign.justify,
                            text:  pdfLib.TextSpan(
                              children: [
                                pdfLib.TextSpan(
                                  children: [
                                      pdfLib.TextSpan(
                                  text: 'Observasão: ',
                                  style:
                                      pdfLib.TextStyle(color: PdfColors.black,  fontWeight: pdfLib.FontWeight.bold),
                                ),
                                  ],
                                ),

                                 pdfLib.TextSpan(
                                  children: [
                                      pdfLib.TextSpan(
                                  text: equipment.obs,
                                  style:
                                      pdfLib.TextStyle(color: PdfColors.black),
                                ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ])
                    );
                  },
                ),
          pdfLib.SizedBox(height: 10),
          pdfLib.Divider(color: PdfColors.black, height: 4),
          pdfLib.SizedBox(height: 10),
          pdfLib.Align(
            alignment: pdfLib.Alignment.topCenter,
            child: pdfLib.Text('Informações extra da supervisão',
                style: pdfLib.TextStyle(
                    fontSize: 16, fontWeight: pdfLib.FontWeight.bold)),
          ),
          pdfLib.SizedBox(height: 3),
          pdfLib.Column(
            mainAxisSize: pdfLib.MainAxisSize.min,
            children: [
            superVisionModel.report == " "
              ? pdfLib.Center(
                  child: pdfLib.Text("Sem informações extras"),
                )
              : pdfLib.Text(
                  '${superVisionModel.report}',
                  textAlign: pdfLib.TextAlign.justify,
                ),
          pdfLib.SizedBox(height: 30),
          pdfLib.Align(
              alignment: pdfLib.Alignment.topLeft,
              child: pdfLib.Text("OBS: Gerado pelo sistema",
                  style: const pdfLib.TextStyle(fontSize: 9))),
          ])
        ],
      ),
    );
    } on TooManyPagesException catch(e){
      utilServices.showToast(text: 'Número máximo de páginas excedeu no documento PDF');
     }

    final bytes2 = await pdf.save();
    file.writeAsBytesSync(bytes2.toList());

    Get.toNamed(PageRoutes.documentRoute, arguments: path);

    final document = await PDFDocument.fromFile(File(path));
    doc = document;
    print('Documento: ----------$document------------');
    pdfLoading.value = false;

    update();
  }
}
