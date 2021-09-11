import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/pages/tabs/chat/chat_person_page.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chatModel;

  const CustomCard({Key? key, required this.chatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ChatPersonPage(
              chatModel: chatModel,
            ));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Icon(
                chatModel.isGroup ? Icons.group : Icons.person,
                color: Colors.white,
                size: 30,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              '${chatModel.name}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text('${chatModel.currentMessage}')
              ],
            ),
            trailing: Text('18:03'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80, right: 20),
            child: Divider(
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
