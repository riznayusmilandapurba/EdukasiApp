import 'dart:async';
import 'package:edukasiapp/views/splashscreen2.dart';
import 'package:flutter/material.dart';


class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("images/bg.jpeg"),
            opacity: 0.4,
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Card(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: EdgeInsets.all(30.20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Nature Exploration",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Jelajahi Keajaiban Alam: Satu Langkah, Satu Kisah, Satu Pengalaman",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                     SizedBox(height: 20),
                     ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SplashScreen2()),
                        );
                      },
                       style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(213, 13, 204, 19),),
                        child: Text('Jelajahi Halaman Selanjutnya',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                         ),
                        ),
                      ),
                  ],
                )
              ),
            ),
          ),
        ),
      );
  }
}