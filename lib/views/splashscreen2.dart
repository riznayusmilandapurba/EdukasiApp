
import 'dart:async';
import 'package:edukasiapp/views/login.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
 Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("images/bg2.jpeg"),
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
                      "Mari ekplorasi keindahan dan keajaiban alam secara menyeluruh",
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
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                       style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: Text('Masuk?',
                          style: TextStyle(
                            color: Color.fromARGB(213, 13, 204, 19),
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