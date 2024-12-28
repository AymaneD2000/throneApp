import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:throneapp/widgets/DrawerApp.dart';

import '../service/api.dart';
import '../widgets/SongWidget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text(
                      'Throne',
                      style: GoogleFonts.montserrat(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF37474F),
                        shadows: [
                          const Shadow(
                            blurRadius: 10,
                            color: Colors.tealAccent,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                    ),), 
                    body: ListView.builder(
                      itemCount: context.read<Api>().songs.length,
                      itemBuilder: (context, count){
                      final song = context.read<Api>().songs;
                      return SongWidget(song: song[count]);
                    }),
    );
  }
}