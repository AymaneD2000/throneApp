import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throneapp/widgets/drawerItem.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Center(
              child: Text(
                        'Throne',
                        style: GoogleFonts.montserrat(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            const Shadow(
                              blurRadius: 10,
                              color: Colors.black,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
            ),
          ),
          DrawerItem(icon: Icons.music_note, text: 'My Music Offline'),
          DrawerItem(icon: Icons.shopping_cart, text: 'My Music to Buy'),
          DrawerItem(icon: Icons.video_library, text: 'Clip Videos'),
          DrawerItem(icon: Icons.info, text: 'About App'),
          DrawerItem(icon: Icons.rate_review, text: 'Rate App'),
        ],
      ),
    );
  }
}