import 'package:edukasiapp/views/page_list_pegawai.dart';
import 'package:flutter/material.dart';
import 'package:edukasiapp/models/model_tambah_pegawai.dart';
import 'package:edukasiapp/models/model_pegawai.dart';
import 'package:http/http.dart' as http;



class TambahDataPegawai extends StatefulWidget {
  const TambahDataPegawai({super.key});

  @override
  State<TambahDataPegawai> createState() => _TambahDataPegawaiState();
}

class _TambahDataPegawaiState extends State<TambahDataPegawai> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtNobp = TextEditingController();
  TextEditingController txtNohp = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> postPegawai() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.post(
        Uri.parse('http://192.168.16.168/edukasi_server/postPegawai.php'),
        body: {
          "nama": txtNama.text,
          "nobp": txtNobp.text,
          "nohp": txtNohp.text,
          "email": txtEmail.text,
        },
      );

      ModelTambahPegawai data = modelTambahPegawaiFromJson(res.body);
      if (data.value == 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${data.message}')),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ListPegawai()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${data.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Form(
                      key: keyForm,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty ? "Tidak Boleh kosong" : null;
                            },
                            controller: txtNama,
                            decoration: InputDecoration(
                              hintText: "Masukkan Nama",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty ? "Tidak Boleh kosong" : null;
                            },
                            controller: txtNobp,
                            decoration: InputDecoration(
                              hintText: "Masukkan NoBp",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty ? "Tidak Boleh kosong" : null;
                            },
                            controller: txtNohp,
                            decoration: InputDecoration(
                              hintText: "Masukkan NoHp",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty ? "Tidak Boleh kosong" : null;
                            },
                            controller: txtEmail,
                            decoration: InputDecoration(
                              hintText: "Masukkan Email",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          MaterialButton(
                            minWidth: 120,
                            height: 45,
                            onPressed: () {
                              if (keyForm.currentState!.validate()) {
                                postPegawai();
                              }
                            },
                            child: Text('Tambah Pegawai'),
                            color: Colors.green,
                            textColor: Colors.white,
                          ),
                          SizedBox(height: 10),
                          if (isLoading)
                            CircularProgressIndicator(color: Colors.green),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}