import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/chat/group_controller.dart';
import 'package:whatsapp_clone/models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contactModel;
  final bool isFromcreateGroup;
  ContactCard(
      {Key? key, required this.contactModel, this.isFromcreateGroup = false})
      : super(key: key);

  final GroupController controller = Get.put(GroupController());

  @override
  Widget build(BuildContext context) {
    print(isFromcreateGroup);
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
            isFromcreateGroup
                ? Obx(() => controller.newGroupList
                            .where((e) => e.name == contactModel.name)
                            .length >
                        0
                    ? Positioned(
                        bottom: 4,
                        right: 5,
                        child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.teal,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            )),
                      )
                    : Container())
                : Container(),
          ],
        ),
      ),
      title: Text(
        '${contactModel.name}',
        style: Theme.of(context).textTheme.subtitle2!.copyWith(),
      ),
      subtitle: Text(
        'A full stack develop',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 13),
      ),
    );
  }
}
