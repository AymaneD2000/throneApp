class Purchase {
  int id;
  int userId;
  int purchaseableId;
  String purchaseableType;
  DateTime createdAt;
  DateTime updatedAt;
  String purchaseType;

  Purchase({
    required this.id,
    required this.userId,
    required this.purchaseableId,
    required this.purchaseableType,
    required this.createdAt,
    required this.updatedAt,
    required this.purchaseType,
  });

  factory Purchase.fromSnapshot(Map<String, dynamic> json) {
    return Purchase(
      id: json['id'],
      userId: json['user_id'],
      purchaseableId: json['purchaseable_id'],
      purchaseableType: json['purchaseable_type'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      purchaseType: json['purchase_type'],
    );
  }
}