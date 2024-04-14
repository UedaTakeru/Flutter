import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };

  User userModelFromJson(String str) => User.fromJson(json.decode(str));
  String userModelToJson(User user) => json.encode(user.toJson());
}