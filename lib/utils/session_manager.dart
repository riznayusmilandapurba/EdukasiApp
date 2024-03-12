import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{
  int? value;
  String? id;
  String? username;
  String? nama;

  //simpan sesi
  Future<void> saveSession(int val, String id, String username, String nama) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("value", val);
    pref.setString("id", id);
    pref.setString("username", username);
    pref.setString("nama", nama);
  }

  Future getSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.getInt("value");
    id = pref.getString("id");
    username = pref.getString("username");
    nama = pref.getString("nama");
  }
  //remove --> logout
  Future clearSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

}

//instance class biar d panggil
SessionManager sessionManager = SessionManager();