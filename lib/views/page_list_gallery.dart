import 'package:flutter/material.dart';
import 'package:edukasiapp/views/page_list_berita.dart';
import 'package:edukasiapp/views/home.dart';
import 'package:edukasiapp/views/page_list_pegawai.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:edukasiapp/models/model_berita.dart';
import 'package:edukasiapp/views/page_user.dart';
import 'package:edukasiapp/views/page_list_detail_gallery.dart';

class ListGallery extends StatefulWidget {
  const ListGallery({super.key});

  @override
  State<ListGallery> createState() => _ListGalleryState();
}

class _ListGalleryState extends State<ListGallery> {
  int _pageIndex = 0;
 GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _pages = [
    ListBerita(),
    ListPegawai(),
    ListGallery(),
    Home(),
  ];

   Future<List<Datum>?> getBerita() async{
    try{
      http.Response res = await http.get(Uri.parse('http://192.168.16.168/edukasi_server/getBerita.php'));
      return modeljudulFromJson(res.body).data;
    }catch(e){
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<Datum>?>(
            future: getBerita(),
            builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Menampilkan dua item dalam satu baris
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Datum? data = snapshot.data?[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageDetailGallery(data)),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9, // Sesuaikan dengan perbandingan lebar dan tinggi gambar yang diinginkan
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'http://192.168.16.168/edukasi_server/gambar_berita/${data?.gambar}',
                                  fit: BoxFit.cover, // Menggunakan BoxFit.cover agar gambar mengisi area dengan mempertahankan aspek rasio
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
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