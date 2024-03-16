import 'dart:convert';

class ModelLogin {
  int value;
  String message;
  String username;
  String nama;
  String id;

  ModelLogin({
    required this.value,
    required this.message,
    required this.username,
    required this.nama,
    required this.id,
  });

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        value: json["value"],
        message: json["message"],
        username: json["username"],
        nama: json["nama"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "message": message,
        "username": username,
        "nama": nama,
        "id": id,
      };

  bool isLoginSuccess() {
    return value == 1;
  }
}

ModelLogin modelLoginFromJson(String str) =>
    ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());
