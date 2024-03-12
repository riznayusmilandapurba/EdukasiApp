import 'package:flutter/material.dart';
import 'package:edukasiapp/models/model_login.dart';
import 'package:edukasiapp/views/page_list_berita.dart';
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
 Future<void> loginAccount() async {
  try {
    setState(() {
      isLoading = true;
    });
    http.Response res = await http.post(
      Uri.parse('http://192.168.0.104/edukasi_server/login.php'),
      body: {
        "username": txtUsername.text,
        "password": txtPassword.text,
      },
    );

    ModelLogin data = modelLoginFromJson(res.body);
    if (data.isLoginSuccess()) {
      sessionManager.saveSession(data.value, data.id, data.username, data.nama);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ListBerita()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${data.message}')));
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(213, 13, 204, 19),
        title: Text(
          'Silahkan Masuk',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
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
                        isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : MaterialButton(
                                minWidth: 120,
                                height: 45,
                                onPressed: () {
                                  if (keyForm.currentState?.validate() == true) {
                                    loginAccount();
                                  }
                                },
                                child: Text('Login'),
                                color: Color.fromARGB(213, 13, 204, 19),
                                textColor: Colors.white,
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