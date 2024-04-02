import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';
import '../../../models/message_model.dart';
import '../../../services/util_services.dart';
import '../../auth/controller/auth_controller.dart';
import '../repository/chat_repository.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ChatController extends GetxController {
  final TextEditingController textController = TextEditingController();
  late IO.Socket socket;
  late String recipientId;
  RxList<MessageModel> chatMessages = <MessageModel>[].obs;

  final chatController = ChatRepository();
  final authController = Get.find<AuthController>();
  RxBool messageSended = false.obs;
  UtilServices utilServices = UtilServices();
  late AutoScrollController scrollController;
  final FocusNode msgFocusNode = FocusNode();
  RxBool isKeyboardVisible = false.obs;
  RxBool isLoadingMessage = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeSocket();
    isKeyboardVisible.value = msgFocusNode.hasFocus;
  }

  void initializeSocket() {
    scrollController = AutoScrollController();

    // Adicione um listener para rolar a lista quando o tamanho da lista mudar
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent > 0 &&
          scrollController.offset >=
              scrollController.position.maxScrollExtent - 3000) {
        // Adicione um buffer de 300 pixels para rolar apenas se estivermos perto do final
        //scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

    // Chame getAllMessages() apenas após o socket estar conectado
    socket = IO.io(
      'https://provision-07c1.onrender.com/',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({'foo': 'bar'})
          .build(),
    );

    socket.onConnect((_) {
      print('Conectado ao socket');
      getAllMessages();
    });

    socket.on('sendMessage', (data) {
      print('Evento sendMessage recebido: $data');

      if (data is String) {
        String messageId = Uuid().v4();

        MessageModel newTemporaryMessage = MessageModel(
          id: messageId,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
          message: data,
          send: authController.user.employeeId,
          receive: authController.user.mecCoordinator,
          deletedAt: '',
        );

        // Verifica se a mensagem temporária já está presente na lista
        bool isDuplicateTemporaryMessage = chatMessages
            .any((message) => message.id != null && message.id == messageId);

        // Adiciona a mensagem temporária apenas se não houver duplicatas
        if (!isDuplicateTemporaryMessage) {
          chatMessages.add(newTemporaryMessage);
          updateMessages();
          print('Mensagens atualizadas: ${chatMessages.length}');
        }
      }
    });

    socket.connect();
  }

  void updateMessages() {
    // Ordena as mensagens por data antes de atualizar a interface
    chatMessages.sort((a, b) {
      final DateTime dateTimeA = DateTime.parse(a.createdAt);
      final DateTime dateTimeB = DateTime.parse(b.createdAt);
      return dateTimeA.compareTo(dateTimeB);
    });

    print('Mensagens atualizadas: ${chatMessages.length}');

    // Move a lista para a última mensagem usando jumpTo
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  Future<void> sendMessage(String text) async {
    //socket.emit("sendMessage", text);
    final result = await chatController.sendMessage(
      authController.user.employeeId,
      authController.user.mecCoordinator,
      text,
    );

    if (result) {
      messageSended.value = true;
      print("Mensagem enviada!");
      utilServices.showToast(text: "Mensagem enviada!");
    } else {
      utilServices.showToast(text: "Mensagem não enviada!", isError: true);
    }
  }

  Future<void> getAllMessages() async {
    isLoadingMessage.value = true;
    final userMessagesResult = await chatController.getAllMessageUser(
      authController.user.employeeId,
      authController.user.mecCoordinator,
    );

    final gestorMessagesResult = await chatController.getAllMessageGestor(
      authController.user.mecCoordinator,
      authController.user.employeeId,
    );

    List<MessageModel> allMessages = [];

    userMessagesResult.when(
      sucess: (userMessages) {
        allMessages.addAll(userMessages);
      },
      error: (errorMessage) {
        utilServices.showToast(text: errorMessage);
      },
    );

    gestorMessagesResult.when(
      sucess: (gestorMessages) {
        isLoadingMessage.value = false;
        allMessages.addAll(gestorMessages);
      },
      error: (errorMessage) {
        utilServices.showToast(text: errorMessage);
      },
    );

    // Limpe a lista antes de adicionar as mensagens
    chatMessages.clear();
    chatMessages.assignAll(allMessages);
    updateMessages();
    update();
  }
}