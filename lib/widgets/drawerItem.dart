import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const DrawerItem({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF37474F)),
      title: Text(
        text,
        style: TextStyle(
          color: Color(0xFF37474F),
          fontSize: 16,
        ),
      ),
      onTap: () {
        // Handle navigation or actions here
      },
    );
  }
}