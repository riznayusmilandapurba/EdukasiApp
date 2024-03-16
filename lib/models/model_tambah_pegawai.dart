// To parse this JSON data, do
//
//     final modelTambahPegawai = modelTambahPegawaiFromJson(jsonString);

import 'dart:convert';

ModelTambahPegawai modelTambahPegawaiFromJson(String str) => ModelTambahPegawai.fromJson(json.decode(str));

String modelTambahPegawaiToJson(ModelTambahPegawai data) => json.encode(data.toJson());

class ModelTambahPegawai {
  int value;
  String message;

  ModelTambahPegawai({
    required this.value,
    required this.message,
  });

  factory ModelTambahPegawai.fromJson(Map<String, dynamic> json) => ModelTambahPegawai(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
