import 'package:edukasiapp/views/home.dart';
import 'package:flutter/material.dart';
import 'package:edukasiapp/models/model_pegawai.dart';
import 'package:edukasiapp/views/page_detail_pegawai.dart';
import 'package:edukasiapp/views/page_list_gallery.dart';
import 'package:edukasiapp/views/tambah_data_pegawai.dart';
import 'package:edukasiapp/views/edit_data_pegawai.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edukasiapp/views/page_list_berita.dart';
import 'package:http/http.dart' as http;
import 'package:edukasiapp/views/page_user.dart';

class ListPegawai extends StatefulWidget {
  const ListPegawai({super.key});

  @override
  State<ListPegawai> createState() => _ListPegawaiState();
}

class _ListPegawaiState extends State<ListPegawai> {
  int _pageIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Color _backgroundColor = Colors.transparent;
  late List<Datum> _pegawaiList;
  late List<Datum> _filteredPegawai;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _pegawaiList = [];
    _filteredPegawai = [];
    _searchController = TextEditingController();
    _getPegawai();
  }

Future<void> _getPegawai() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.16.168/edukasi_server/getPegawai.php'));
      if (response.statusCode == 200) {
        final List<Datum> pegawaiList = ModelPegawaiFromJson(response.body).data!;
        setState(() {
          _pegawaiList = pegawaiList;
          _filteredPegawai = pegawaiList;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> _deletePegawai(int id) async {
  try {
    http.Response res = await http.post(
      Uri.parse('http://192.168.16.168/edukasi_server/deletePegawai.php'),
      body: {'id': id.toString()}, 
    );
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pegawai berhasil dihapus')),
      );
      _getPegawai();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menghapus pegawai')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString())),
    );
  }
}


  void _filterPegawai(String keyword) {
    keyword = keyword.toLowerCase();
    setState(() {
      _filteredPegawai = _pegawaiList.where((pegawai) =>
        pegawai.nama.toLowerCase().contains(keyword) ||
        pegawai.nobp.toLowerCase().contains(keyword)
      ).toList();
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _filterPegawai,
          decoration: InputDecoration(
            hintText: 'Cari pegawai...',
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.green),
        ),
       
      ),
     body: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'List Pegawai',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TambahDataPegawai()),
              );
            },
          ),
        ],
      ),
    ),
    Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Nama')),
              DataColumn(label: Text('NoBP')),
              DataColumn(label: Text('Action')),
            ],
            rows: _filteredPegawai.map((datum) {
              return DataRow(
                cells: [
                  DataCell(Text(datum.nama)),
                  DataCell(Text(datum.nobp)),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.list, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageDetailPegawai(datum)),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.yellow),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditDataPegawai(
                                id: datum.id,
                                nama: datum.nama,
                                nobp: datum.nobp,
                                nohp: datum.nohp,
                                email: datum.email,
                              )),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Konfirmasi Hapus'),
                                  content: Text('Apakah Anda yakin ingin menghapus pegawai ini?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _deletePegawai(int.parse(datum.id));
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Hapus'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    ),
  ],
),
  bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.article, size: 30),
        Icon(Icons.account_circle, size: 30),
        Icon(Icons.photo_library, size: 30),
        Icon(Icons.verified_user, size: 30),
      ],
      onTap: (index) {
          setState(() {
            _pageIndex = index;
            
          });
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ListBerita()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ListPegawai()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ListGallery()),
            );
            break;
          case 4:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PageUser()),
            );
            break;
        }
      },
    ),

    );
  }
}