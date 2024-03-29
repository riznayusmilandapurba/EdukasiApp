import 'dart:convert';

import 'package:edukasiapp/views/login.dart';
import 'package:flutter/material.dart';
import 'package:edukasiapp/models/model_register.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNohp = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;
  Future<ModelRegister?> registerAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.post(
          Uri.parse('http://192.168.16.168/edukasi_server/register.php'),
          body: {
            "nama": txtNama.text,
            "username": txtUsername.text,
            "password": txtPassword.text,
            "email": txtEmail.text,
            "nohp": txtNohp.text,
          });

      ModelRegister data = modelRegisterFromJson(res.body);
      //cek kondisi respon
      if (data.value == 1) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
          //kondisi berhasil dan pindah ke page login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        });
        //kondisi email sudah ada
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
        //kondisi gagal daftar
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${data.message}')));
      }
    } catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
        child: Form(
          key: keyForm,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(35),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      'Form Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty ? "Tidak Boleh kosong" : null;
                            },
                            controller: txtNama,
                            decoration: InputDecoration(
                              hintText: "Full Name",
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
                            controller: txtUsername,
                            decoration: InputDecoration(
                              hintText: "Username",
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
                            controller: txtPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
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
                              hintText: "Email",
                              hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
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
                              hintText: "No. Handphone",
                              hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : MaterialButton(
                              minWidth: 120,
                                    height: 45,
                                    onPressed: () {
                                      if (keyForm.currentState?.validate() == true) {
                                        registerAccount();
                                      }
                                    },
                                    child: Text('Register'),
                                    color: Colors.green,
                                    textColor: Colors.white,
                                  ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Text(
                              'Anda Sudah Punya Akun ? Silahkan Login',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(213, 13, 204, 19),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}