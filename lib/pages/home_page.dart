import 'package:flutter/material.dart';

import 'tabs/chat/chat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp Clone'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (val) {
                print(val);
              },
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    child: Text('New group'),
                    value: 'new',
                  ),
                  PopupMenuItem(
                    child: Text('New broadcast'),
                    value: 'broad',
                  ),
                  PopupMenuItem(
                    child: Text('Whatsapp web'),
                    value: 'web',
                  ),
                  PopupMenuItem(
                    child: Text('Starred messages'),
                    value: 'starred',
                  ),
                  PopupMenuItem(
                    child: Text('Settings'),
                    value: 'set',
                  ),
                ];
              })
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'Chats',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Calls',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [Text('camera'), ChatPage(), Text('status'), Text('calls')],
      ),
    );
  }
}
