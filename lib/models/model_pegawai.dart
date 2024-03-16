import 'dart:convert';

ModelPegawai ModelPegawaiFromJson(String str) => ModelPegawai.fromJson(json.decode(str));

String ModelPegawaiToJson(ModelPegawai data) => json.encode(data.toJson());

class ModelPegawai {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelPegawai({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelPegawai.fromJson(Map<String, dynamic> json) => ModelPegawai(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  Map<String, dynamic> toJsonWithDelete(int id) => {
  "id": id,
  "isSuccess": isSuccess,
  "message": message,
  "data": List<dynamic>.from(data.map((x) => x.toJson())),
};

  static ModelPegawai deleteFromJson(Map<String, dynamic> json) {
    return ModelPegawai(
      isSuccess: json["isSuccess"],
      message: json["message"],
      data: [],
    );
  }
}

class Datum {
  String id;
  String nama;
  String nobp;
  String nohp;
  String email;
  DateTime tanggal_input;

  Datum({
    required this.id,
    required this.nama,
    required this.nobp,
    required this.nohp,
    required this.email,
    required this.tanggal_input,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["nama"],
    nobp: json["nobp"],
    nohp: json["nohp"],
    email: json["email"],
    tanggal_input: DateTime.parse(json["tanggal_input"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "nobp": nobp,
    "nohp": nohp,
    "email": email,
    "tanggal_input": tanggal_input.toIso8601String(),
  };
}
