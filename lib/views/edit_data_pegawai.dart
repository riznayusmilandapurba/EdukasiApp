import 'package:edukasiapp/views/page_list_pegawai.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:edukasiapp/models/model_pegawai.dart';
import 'package:edukasiapp/views/page_list_berita.dart'; // Import halaman list berita

class EditDataPegawai extends StatefulWidget {
  final String id;
  final String nama;
  final String nobp;
  final String nohp;
  final String email;

  const EditDataPegawai({
    required this.id,
    required this.nama,
    required this.nobp,
    required this.nohp,
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  State<EditDataPegawai> createState() => _EditDataPegawaiState();
}

class _EditDataPegawaiState extends State<EditDataPegawai> {
  late TextEditingController _txtNama;
  late TextEditingController _txtNobp;
  late TextEditingController _txtNohp;
  late TextEditingController _txtEmail;
  late GlobalKey<FormState> _keyForm;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _txtNama = TextEditingController(text: widget.nama);
    _txtNobp = TextEditingController(text: widget.nobp);
    _txtNohp = TextEditingController(text: widget.nohp);
    _txtEmail = TextEditingController(text: widget.email);
    _keyForm = GlobalKey<FormState>();
    _isLoading = false;
  }

  Future<void> _editPegawai() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.102/edukasi_server/updatePegawai.php'),
        body: {
          "id": widget.id,
          "nama": _txtNama.text,
          "nobp": _txtNobp.text,
          "nohp": _txtNohp.text,
          "email": _txtEmail.text,
        },
      );

      // Handle response
      // ...

      // Navigasi ke halaman list berita setelah berhasil diedit
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ListPegawai()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Pegawai'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _txtNama,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _txtNobp,
                decoration: InputDecoration(labelText: 'NoBP'),
              ),
              TextFormField(
                controller: _txtNohp,
                decoration: InputDecoration(labelText: 'NoHP'),
              ),
              TextFormField(
                controller: _txtEmail,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    _editPegawai();
                  }
                },
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.yellow)
                    : Text('Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _txtNama.dispose();
    _txtNobp.dispose();
    _txtNohp.dispose();
    _txtEmail.dispose();
    super.dispose();
  }
}
