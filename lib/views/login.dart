import 'package:flutter/material.dart';
import 'package:edukasiapp/models/ModelLogin.dart';
import 'package:edukasiapp/views/page_list_berita.dart';
import 'package:edukasiapp/views/home.dart';
import 'package:edukasiapp/views/register.dart';
import 'package:http/http.dart' as http;
import 'package:edukasiapp/utils/session_manager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;
 Future<ModelLogin?> loginAccount() async {
  try {
    setState(() {
      isLoading = true;
    });
    http.Response res = await http.post(
      Uri.parse('http://192.168.0.102/edukasi_server/login.php'),
      body: {
        "username": txtUsername.text,
        "password": txtPassword.text,
      },
    );

    ModelLogin data = modelLoginFromJson(res.body);
      //cek kondisi respon
      if (data.value == 1) {
        setState(() {
          isLoading = false;
          sessionManager.saveSession(data.value ?? 0, data.id ?? "", data.username ?? "", data.nama ?? "");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
          //kondisi berhasil dan pindah ke page login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/grandcanyon.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
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
                        Center(
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : MaterialButton(
                              minWidth: 120,
                                    height: 45,
                                    onPressed: () {
                                 
                                      // if (keyForm.currentState!.validate()) {
                                      //   loginAccount();
                                      // }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: 
                                        (context) => Home()
                                        ),
                                        );
                                    },
                                    child: Text('Login'),
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                  ),
                          ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                              (route) => false,
                            );
                          },
                          child: Text(
                            'Belum Punya Akun ? Silahkan Register',
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
        ],
      ),
    );
  }
}