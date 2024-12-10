class User{
  String nom;
  String email;
  String? password;
  String? confirmation;

  User({this.confirmation, required this.email,this.password, required this.nom});
   Map<String, dynamic> toMap() {
    return {'name': nom, 'email': email, "password":password, 'password_confirmation':confirmation};
  }

  factory User.fromSanpshot(Map<String, dynamic> json){
    print(json);
    return User(
      email: json['email'],
      nom:json['name'],
    );
  }
}