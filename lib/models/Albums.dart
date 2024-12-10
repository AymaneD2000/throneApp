import 'package:throneapp/models/Artiste.dart';
import 'package:throneapp/models/Purchase.dart';
import 'package:throneapp/models/Song.dart';

class Album {
  int id;
  String title;
  int artistId;
  bool isFree;
  String cover;
  DateTime createdAt;
  DateTime updatedAt;
  double price;
  Artist artist;
  List<Song> songs;
  List<Purchase> purchases;

  Album({
    required this.id,
    required this.title,
    required this.artistId,
    required this.isFree,
    required this.cover,
    required this.createdAt,
    required this.updatedAt,
    required this.price,
    required this.artist,
    required this.songs,
    required this.purchases,
  });

  factory Album.fromSnapshot(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      artistId: json['artist_id'],
      isFree: json['is_free'] == 1,
      cover: json['cover'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      price: json['price']?.toDouble() ?? 0.0,
      artist: Artist.fromSnapshot(json['artist']),
      songs: (json['songs'] as List).map((e) => Song.fromSnapshot(e)).toList(),
      purchases:
          (json['purchases'] as List).map((e) => Purchase.fromSnapshot(e)).toList(),
    );
  }
}