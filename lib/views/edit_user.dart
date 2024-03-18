import 'package:flutter/material.dart';
import 'package:edukasiapp/models/ModelLogin.dart';
import 'package:edukasiapp/utils/session_manager.dart';
import 'package:edukasiapp/views/page_user.dart';


class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
 late TextEditingController _namaController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _noHpController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: sessionManager.nama ?? '');
    _usernameController = TextEditingController(text: sessionManager.username ?? '');
    _emailController = TextEditingController(text: sessionManager.email ?? '');
    _noHpController = TextEditingController(text: sessionManager.nohp ?? '');
  }

  @override
  void dispose() {
    _namaController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    super.dispose();
  }

 void _saveChanges() {
    sessionManager.nama = _namaController.text;
    sessionManager.username = _usernameController.text;
    sessionManager.email = _emailController.text;
    sessionManager.nohp = _noHpController.text;

    sessionManager.saveSession(
      1, // Misalkan nilai 1 untuk value jika berhasil disimpan
      sessionManager.id ?? '', // Gunakan nilai id yang sudah ada atau string kosong jika null
      sessionManager.username ?? '', // Gunakan nilai username yang sudah ada atau string kosong jika null
      sessionManager.nama ?? '', // Gunakan nilai nama yang sudah ada atau string kosong jika null
      _emailController.text, // Gunakan nilai email yang baru diubah
      _noHpController.text, // Gunakan nilai nohp yang baru diubah
    );

    Navigator.maybePop(context);

  // Lanjutkan ke halaman PageUser setelah menyimpan perubahan
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => PageUser()),
  );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _noHpController,
              decoration: InputDecoration(labelText: 'Nomor HP'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}