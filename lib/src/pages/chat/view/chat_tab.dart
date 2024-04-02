// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/chat_controller.dart';
import 'components/tile_message.dart';
import '../../../config/custom_colors.dart';
import '../../auth/controller/auth_controller.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final authController = Get.find<AuthController>();
  final chatController = Get.find<ChatController>();
  final msgInputController = TextEditingController();

  String formatDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
  

  @override
  Widget build(BuildContext context) {
    double larguraContainer = MediaQuery.of(context).size.width * 0.8;

    Future _ligarVendedor(String telefone) async {
      if (await canLaunchUrl(Uri(
        scheme: "tel",
        path: telefone,
      ))) {
        await launchUrl(Uri(
          scheme: "tel",
          path: telefone,
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 53,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.customBlueColor,
        title: const Row(
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage("assets/image_supervisor"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "_______",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _ligarVendedor("937692714");
            },
            icon: const Icon(
              Icons.phone,
              size: 35,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/chatFundo.webp"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Obx(() => chatController.isLoadingMessage.value
                            ? const Center(
                                child: Text(
                                  "Carregando...",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              )
                            : ListView.builder(
                                controller: chatController.scrollController,
                                itemCount: chatController.chatMessages.length,
                                itemBuilder: (context, index) {
                                  var currentItem =
                                      chatController.chatMessages[index];
                                  DateTime dateTime =
                                      DateTime.parse(currentItem.createdAt);

                                  var previousItem = index > 0
                                      ? chatController.chatMessages[index - 1]
                                      : null;

                                  bool sameDay = false;

                                  if (previousItem != null &&
                                      previousItem.createdAt != null) {
                                    DateTime previousDateTime =
                                        DateTime.parse(previousItem.createdAt);

                                    sameDay = dateTime.day ==
                                            previousDateTime.day &&
                                        dateTime.month ==
                                            previousDateTime.month &&
                                        dateTime.year == previousDateTime.year;
                                  }

                                  if (index == 0 || !sameDay) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            formatDate(DateTime.parse(
                                                currentItem.createdAt)),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        TileMessage(
                                          sentByMe: currentItem.send ==
                                              authController.user.employeeId,
                                          messageModel: currentItem,
                                          larguraContainer: larguraContainer,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return TileMessage(
                                      sentByMe: currentItem.send ==
                                          authController.user.employeeId,
                                      messageModel: currentItem,
                                      larguraContainer: larguraContainer,
                                    );
                                  }
                                },
                              ));
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: TextField(
                              focusNode: chatController.msgFocusNode,
                              controller: msgInputController,
                              keyboardType: TextInputType.text,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: "Digite mensagem",
                                hintStyle: const TextStyle(fontSize: 15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(32, 8, 32, 8),
                                prefixIcon: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: CustomColors.customBlueColor
                                        .withOpacity(0.5),
                                  ),
                                  onPressed: () {
                                    if (msgInputController.text
                                        .trim()
                                        .isNotEmpty) {
                                      chatController
                                          .sendMessage(msgInputController.text);
                                      msgInputController.clear();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor:
                              CustomColors.customBlueColor.withOpacity(0.5),
                          onPressed: () {
                            if (msgInputController.text.trim().isNotEmpty) {
                              chatController
                                  .sendMessage(msgInputController.text);
                              msgInputController.clear();
                              chatController.msgFocusNode.unfocus();
                              print("Teclado deveria desaparecer");
                            }
                          },
                          child:  const Icon(Icons.send, color: Colors.white),
                          mini: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Positioned(
              right: 15,
              bottom: 80,
              child: IconButton(
                  onPressed: () {
                    if (chatController.chatMessages.isNotEmpty) {
                      // A lista não está vazia, agora você pode rolar para o último elemento.
                      chatController.scrollController.animateTo(
                        chatController
                            .scrollController.position.maxScrollExtent,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.keyboard_double_arrow_down_sharp,
                    size: 30,
                  ),
                  color: CustomColors.customBlueColor))
        ],
      ),
    );
  }
}
