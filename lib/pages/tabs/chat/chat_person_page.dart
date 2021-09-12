import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/shared/custom-ui/chat/text_field_chat.dart';

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
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 30,
          titleSpacing: 0,
          leading: IconButton(
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
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                      Text(
                        'last seen today 19:00',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                            ),
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldChat(),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 25,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
