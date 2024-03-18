import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:edukasiapp/models/model_berita.dart';
import 'package:edukasiapp/views/page_detail_berita.dart';
import 'package:edukasiapp/views/page_list_gallery.dart';
import 'package:edukasiapp/views/home.dart';
import 'package:edukasiapp/views/page_list_pegawai.dart';
import 'package:edukasiapp/views/page_user.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class ListBerita extends StatefulWidget {
  const ListBerita({super.key});

  @override
  State<ListBerita> createState() => _ListBeritaState();
}

class _ListBeritaState extends State<ListBerita> {
  int _pageIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  late List<Datum> _beritaList;
  late List<Datum> _filteredBerita;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _beritaList = [];
    _filteredBerita = [];
    _searchController = TextEditingController();
    _getBerita();
  }

  Future<void> _getBerita() async {
    try {
      http.Response res = await http.get(Uri.parse('http://192.168.16.168/edukasi_server/getBerita.php'));
      List<Datum> beritaList = modeljudulFromJson(res.body).data ?? [];
      setState(() {
        _beritaList = beritaList;
        _filteredBerita = beritaList;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void _filterBerita(String keyword) {
    keyword = keyword.toLowerCase();
    setState(() {
      _filteredBerita = _beritaList.where((berita) =>
        berita.judul.toLowerCase().contains(keyword) ||
        berita.berita.toLowerCase().contains(keyword)
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: (value) => _filterBerita(value),
          decoration: InputDecoration(
            hintText: 'Cari berita...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => _searchController.clear(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: _filteredBerita.length,
            itemBuilder: (context, index) {
              Datum data = _filteredBerita[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageDetailBerita(data)),
                  );
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'http://192.168.16.168/edukasi_server/gambar_berita/${data.gambar}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          data.judul,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          data.berita,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
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