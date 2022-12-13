import 'dart:convert';

Apipost apipostFromJson(String str) => Apipost.fromJson(json.decode(str));

String apipostToJson(Apipost data) => json.encode(data.toJson());

class Apipost {
  Apipost({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory Apipost.fromJson(Map<String, dynamic> json) => Apipost(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
