import 'package:edukasiapp/views/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:edukasiapp/models/ModelLogin.dart';
import 'package:edukasiapp/views/login.dart';
import 'package:http/http.dart' as http;
import 'package:edukasiapp/utils/session_manager.dart';
import 'package:edukasiapp/views/page_list_berita.dart';
import 'package:edukasiapp/views/page_list_gallery.dart';
import 'package:edukasiapp/views/page_list_pegawai.dart';
import 'package:edukasiapp/views/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class PageUser extends StatefulWidget {
  const PageUser({super.key});

  @override
  State<PageUser> createState() => _PageUserState();
}

class _PageUserState extends State<PageUser> {
  int _pageIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    ListBerita(),
    ListPegawai(),
    ListGallery(),
    Home(),
  ];

 @override
  void initState() {
    super.initState();
    sessionManager.getSession().then((_) {
      setState(() {}); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: sessionManager.nama != null && sessionManager.username != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User Profile',
                  style: TextStyle(
                        color: Colors.grey,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  SizedBox(height: 30),
                  Text('${sessionManager.nama}',
                  style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        
                      ),
                  ),
                  Text('${sessionManager.username}',
                  style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                  ),
                  Text('${sessionManager.email}',
                  style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                  ),
                  Text('${sessionManager.nohp}',
                  style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          sessionManager.clearSession();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(213, 13, 204, 19),
                        ),
                        child: Text(
                          'LogOut',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          sessionManager.clearSession();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => EditUser()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(213, 13, 204, 19),
                        ),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : CircularProgressIndicator(),
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