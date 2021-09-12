import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;

  const ButtonCard(
      {Key? key, required this.title, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Color(0xFF25D366),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(),
        ),
      ),
    );
  }
}
