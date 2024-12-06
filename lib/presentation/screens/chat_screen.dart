import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_de/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_de/domain/message.dart';
import 'package:yes_no_app_de/infrastructure/models/yes_no_model.dart';
import 'package:yes_no_app_de/main.dart';
import 'package:yes_no_app_de/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_de/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_de/presentation/widgets/chat/other_message_bubble.dart';
import 'package:yes_no_app_de/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.sdpnoticias.com/resizer/v2/3DSDDUH66BF5VMFI7F62LCHFOM.jpg?smart=true&auth=df2f144467b3cc9dd5cc9846388222d49725f1067cec7bbd2a0a21a48f443d82&width=640&height=360'),
          ),
        ),
        title: const Text('Cbum Mr.⭕'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.hers)
                          ? OtherMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),

            /// Caja de texto de mensajes
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessge(value),
            ),
          ],
        ),
      ),
    );
  }
}
