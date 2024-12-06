import 'package:flutter/material.dart';
import 'package:yes_no_app_de/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_de/domain/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Cbum', fromWho: FromWho.me),
    Message(
        text: 'Vas a volver a competir en el Mr. Olympia?',
        fromWho: FromWho.me),
  ];

  Future<void> sendMessge(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.contains('?')) {
      await otherReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> otherReply() async {
    final otherMessage = await getYesNoAnswer.getAnswer();
    messageList.add(otherMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
