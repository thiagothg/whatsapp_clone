import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/models/contact_model.dart';
import 'package:whatsapp_clone/shared/custom-ui/button_card.dart';
import 'package:whatsapp_clone/shared/custom-ui/contact_card.dart';

class SelectContactpage extends StatefulWidget {
  const SelectContactpage({Key? key}) : super(key: key);

  @override
  _SelectContactpageState createState() => _SelectContactpageState();
}

class _SelectContactpageState extends State<SelectContactpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white, fontSize: 19),
            ),
            Text(
              '257 contacts',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white, fontSize: 13),
            )
          ],
        ),
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
                    child: Text('Invite a friend'),
                    value: 'invite_friend',
                  ),
                  PopupMenuItem(
                    child: Text('Contacts'),
                    value: 'contacts',
                  ),
                  PopupMenuItem(
                    child: Text('Refresh'),
                    value: 'refresh',
                  ),
                  PopupMenuItem(
                    child: Text('Help'),
                    value: 'help',
                  ),
                ];
              })
        ],
      ),
      body: ListView.builder(
        itemCount: ContactModel.listContacts().length,
        itemBuilder: (_, index) {
          if (index == 0) {
            return ButtonCard(
                title: 'New group',
                icon: Icons.group,
                onTap: () {
                  Get.toNamed('/create-group');
                });
          } else if (index == 1) {
            return ButtonCard(title: 'New contact', icon: Icons.person_add);
          } else {
            return ContactCard(
              contactModel: ContactModel.listContacts()[index],
            );
          }
        },
        // children: [
        //   ButtonCard(
        //       title: 'New group',
        //       icon: Icons.group,
        //       onTap: () {
        //         Get.toNamed('/create-group');
        //       }),
        //   ButtonCard(title: 'New contact', icon: Icons.person_add),
        //   ContactCard(),
        //   ContactCard(),
        // ],
      ),
    );
  }
}
