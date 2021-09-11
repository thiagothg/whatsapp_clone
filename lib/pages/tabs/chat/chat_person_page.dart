import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class ChatPersonPage extends StatefulWidget {
  final ChatModel chatModel;
  const ChatPersonPage({Key? key, required this.chatModel}) : super(key: key);

  @override
  _ChatPersonPageState createState() => _ChatPersonPageState();
}

class _ChatPersonPageState extends State<ChatPersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        titleSpacing: 0,
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24,
            )),
        title: InkWell(
          onTap: () {
            print('chat profile');
          },
          child: Container(
            padding: EdgeInsets.all(6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    widget.chatModel.isGroup ? Icons.group : Icons.person,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.chatModel.name}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.white, fontSize: 18.5),
                    ),
                    Text(
                      'last seen today 19:00',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (val) {
                print(val);
              },
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    child: Text('View contacts'),
                    value: 'contacts',
                  ),
                  PopupMenuItem(
                    child: Text('Media, links and Docs'),
                    value: 'media_links_docs',
                  ),
                  PopupMenuItem(
                    child: Text('Search'),
                    value: 'search',
                  ),
                  PopupMenuItem(
                    child: Text('Mute Notifications'),
                    value: 'mute',
                  ),
                  PopupMenuItem(
                    child: Text('WallPaper'),
                    value: 'wallpaper',
                  ),
                ];
              })
        ],
      ),
    );
  }
}
