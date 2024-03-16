import 'package:flutter/material.dart';
import 'package:edukasiapp/models/model_pegawai.dart';
import 'package:intl/intl.dart';

class PageDetailPegawai extends StatelessWidget {
  final Datum? data;
  const PageDetailPegawai(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  data?.nama ?? "",
                  style: TextStyle(
                    color: Color.fromARGB(213, 13, 204, 19),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  data?.nobp ?? "",
                  style: TextStyle(
                  fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  data?.nohp ?? "",
                  style: TextStyle(
                  fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  data?.email ?? "",
                  style: TextStyle(
                  fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}