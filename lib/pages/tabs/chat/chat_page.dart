import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/shared/custom-ui/custom_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
            itemCount: ChatModel.listChats().length,
            itemBuilder: (_, index) {
              return CustomCard(
                chatModel: ChatModel.listChats()[index],
              );
            }));
  }
}
