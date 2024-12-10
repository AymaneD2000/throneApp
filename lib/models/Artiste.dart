class Artist {
  int id;
  String name;
  String email;
  String phoneNumber;
  String cover;
  String? facebookLink;
  String? instagramLink;
  String? twitterLink;
  String? snapchatLink;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Artist({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.cover,
    this.facebookLink,
    this.instagramLink,
    this.twitterLink,
    this.snapchatLink,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Artist.fromSnapshot(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      cover: json['cover'],
      facebookLink: json['facebook_link'],
      instagramLink: json['instagram_link'],
      twitterLink: json['twitter_link'],
      snapchatLink: json['snapchat_link'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}