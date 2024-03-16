import 'package:flutter/material.dart';
import 'package:edukasiapp/views/page_list_berita.dart';
import 'package:edukasiapp/views/page_list_gallery.dart';
import 'package:edukasiapp/views/page_list_pegawai.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pageIndex = 0;
  Color _backgroundColor = Colors.transparent;

  final List<Widget> _pages = [
    ListBerita(),
    ListPegawai(),
    ListGallery(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bromo.jpeg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.20),
                child: Column(
                  children: [
                    Text(
                      'Nature Exploration',
                      style: TextStyle(
                        color: Color.fromARGB(213, 13, 204, 19),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Explore the beauty of nature with us',
                      style: TextStyle(
                        color: Color.fromARGB(213, 13, 204, 19),
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: _backgroundColor,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.article, size: 30),
        Icon(Icons.account_circle, size: 30),
        Icon(Icons.photo_library, size: 30),
      ],
      onTap: (index) {
          setState(() {
            _pageIndex = index;
            switch (index) {
              case 0:
                _backgroundColor = Colors.green;
                break;
              case 1:
                _backgroundColor = Colors.green;
                break;
              case 2:
                _backgroundColor = Colors.green;
                break;
              case 3:
                _backgroundColor = Colors.green;
                break;
            }
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
        }
      },
    ),

    );
  }
}