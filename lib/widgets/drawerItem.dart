import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const DrawerItem({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {
          // Handle navigation or actions here
        },
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.teal.withOpacity(0.3),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.teal),
            title: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF37474F),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF616161),
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
