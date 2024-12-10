class Song {
  int id;
  String title;
  String cover;
  String songPath;
  int artistId;
  int? genreId;
  int? albumId;
  int? mixtapeId;
  bool isFree;
  DateTime createdAt;
  DateTime updatedAt;
  double price;
  String type;

  Song({
    required this.id,
    required this.title,
    required this.cover,
    required this.songPath,
    required this.artistId,
    this.genreId,
    this.albumId,
    this.mixtapeId,
    required this.isFree,
    required this.createdAt,
    required this.updatedAt,
    required this.price,
    required this.type,
  });

  factory Song.fromSnapshot(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      cover: json['cover'],
      songPath: json['song_path'],
      artistId: json['artist_id'],
      genreId: json['genre_id'],
      albumId: json['album_id'],
      mixtapeId: json['mixtape_id'],
      isFree: json['is_free'] == 1,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      price: json['price']?.toDouble() ?? 0.0,
      type: json['type'],
    );
  }
}