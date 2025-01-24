import 'package:throneapp/models/Artiste.dart';
import 'package:throneapp/models/Mixtape.dart';
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
  int? album_id;
  int? mixtape_id;
  Album? album;
  Mixtape? mixtape;
  Artist artist;
  List<Song> songs;
  List<Purchase> purchases;

  Album({
    this.album_id,
    this.mixtape_id,
    this.album,
    this.mixtape,
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
      album_id: json['album_id'],
      mixtape_id: json['mixtape_id'],
      mixtape: json['mixtape'] != null
          ? Mixtape.fromSnapshot(json['mixtape'])
          : null,
      album: json["album"] != null ? Album.fromSnapshot(json['album']) : null,
      artist: Artist.fromSnapshot(json['artist']),
      songs: (json['songs'] as List).map((e) => Song.fromSnapshot(e)).toList(),
      purchases: (json['purchases'] as List)
          .map((e) => Purchase.fromSnapshot(e))
          .toList(),
    );
  }
}
