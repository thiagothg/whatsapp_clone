import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/contact_model.dart';

class AvatarCard extends StatelessWidget {
  final ContactModel contactModel;

  const AvatarCard({Key? key, required this.contactModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
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
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 18,
                    )),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '${contactModel.name}',
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
