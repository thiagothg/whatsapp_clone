import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/chat/group_controller.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/models/contact_model.dart';
import 'package:whatsapp_clone/shared/custom-ui/contact_card.dart';
import 'package:whatsapp_clone/shared/custom-ui/group/avatar_card.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final groupController = Get.put(GroupController());

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
              'New Group',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white, fontSize: 19),
            ),
            Text(
              'Add participants',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white, fontSize: 13),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Obx(() => groupController.newGroupList.length > 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 75,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: groupController.newGroupList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                                onTap: () {
                                  print('remove contact');
                                  print(groupController.newGroupList.length);
                                  groupController.removeContactFromNewGroup(
                                      groupController.newGroupList[index]);
                                },
                                child: AvatarCard(
                                  contactModel:
                                      groupController.newGroupList[index],
                                ));
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container()),
          Expanded(
            child: ListView.builder(
                itemCount: ContactModel.listContacts().length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      print('add to group');
                      groupController.addContactToNewGroup(
                          ContactModel.listContacts()[index]);
                    },
                    child: ContactCard(
                      isFromcreateGroup: true,
                      contactModel: ContactModel.listContacts()[index],
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: Obx(() => groupController.newGroupList.length > 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.send),
            )
          : Container()),
    );
  }
}
