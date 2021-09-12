import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/chat/chat_message_conttroller.dart';

class TextFieldChat extends StatefulWidget {
  const TextFieldChat({Key? key}) : super(key: key);

  @override
  _TextFieldChatState createState() => _TextFieldChatState();
}

class _TextFieldChatState extends State<TextFieldChat> {
  final chatMessageController = Get.put(ChatMessageController());

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(right: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          minLines: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type a message',
            contentPadding: EdgeInsets.all(5),
            prefixIcon:
                IconButton(onPressed: () {}, icon: Icon(Icons.emoji_emotions)),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) => bottomSheetActions());
                    },
                    icon: Icon(Icons.attach_file)),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt)),
              ],
            ),
          ),
        ));
  }

  Widget bottomSheetActions() {
    return Container(
      height: MediaQuery.of(context).size.width * 0.85,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomSheetActionItem(
                      icon: Icons.insert_drive_file,
                      text: 'Document',
                      color: Colors.blue,
                      onTap: () {
                        print('doc');
                      }),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  bottomSheetActionItem(
                      icon: Icons.camera_alt,
                      text: 'Camera',
                      color: Colors.pink),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  bottomSheetActionItem(
                      icon: Icons.insert_drive_file,
                      text: 'Gallary',
                      color: Colors.purple),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomSheetActionItem(
                      icon: Icons.headset, text: 'Audio', color: Colors.orange),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  bottomSheetActionItem(
                      icon: Icons.location_pin,
                      text: 'Location',
                      color: Colors.green),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  bottomSheetActionItem(
                      icon: Icons.person, text: 'Contact', color: Colors.blue),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetActionItem({
    required IconData icon,
    required String text,
    required Color color,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.09,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.08,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(text)
        ],
      ),
    );
  }
}
