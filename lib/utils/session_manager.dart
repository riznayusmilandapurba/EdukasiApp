import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{
  int? value;
  String? id;
  String? username;
  String? nama;
  String? email;
  String? nohp;

  //simpan sesi
  Future<void> saveSession(int val, String id, String username, String nama, String email, String nohp) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("value", val);
    pref.setString("id", id);
    pref.setString("username", username);
    pref.setString("nama", nama);
    pref.setString("email", email);
    pref.setString("nohp", nohp);
  }

  Future getSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.getInt("value");
    id = pref.getString("id");
    username = pref.getString("username");
    nama = pref.getString("nama");
    email = pref.getString("email");
    nohp = pref.getString("nohp");
  }
  //remove --> logout
  Future clearSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

}

//instance class biar d panggil
SessionManager sessionManager = SessionManager();