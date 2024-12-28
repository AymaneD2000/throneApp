import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throneapp/models/Song.dart';

class SongWidget extends StatelessWidget {
  final Song song;

  const SongWidget({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.teal.withOpacity(0.1),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Song Cover Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                song.cover,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            // Song Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF37474F),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    song.price.toString() + ' FCFA',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: const Color(0xFF616161),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    song.price == 0 ? "Gratuit" : "Payant",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: song.price == 0
                          ? Colors.teal
                          : const Color(0xFFBF360C), // Teal for free, red for paid
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            // Action Icon
            IconButton(
              icon: const Icon(
                Icons.play_circle_fill,
                color: Colors.teal,
                size: 30,
              ),
              onPressed: () {
                // Handle play action
              },
            ),
          ],
        ),
      ),
    );
  }
}
