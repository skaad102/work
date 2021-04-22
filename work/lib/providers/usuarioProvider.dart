import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:work/models/prefUser.dart';

class UsuarioProvider {
  final apiKey = 'AIzaSyDcthaylOUS4okAMHjfcrD7lFI3XCu3soE';
  final pref = PreferenciasUsuario();
  Future<Map> login(String email, String pass) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey");

    final authData = {
      'email': "$email@correo.co",
      'password': pass,
      'returnSecureToken': true
    };

    final res = await http.post(url, body: jsonEncode(authData));

    Map<String, dynamic> decodeRes = jsonDecode(res.body);

    if (decodeRes.containsKey('idToken')) {
      pref.token = decodeRes['idToken'];
      return {'ok': true};
    } else {
      return {'ok': false, 'mensaje': decodeRes['error']['message']};
    }
  }

  Future<Map> nuevoUsuario(String email, String pass) async {
    final apiKey = 'AIzaSyDcthaylOUS4okAMHjfcrD7lFI3XCu3soE';

    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey");

    final authData = {
      'email': "$email@correo.co",
      'password': pass,
      'returnSecureToken': true
    };

    final res = await http.post(url, body: jsonEncode(authData));

    Map<String, dynamic> decodeRes = jsonDecode(res.body);

    if (decodeRes.containsKey('idToken')) {
      pref.token = decodeRes['idToken'];
      return {'ok': true};
    } else {
      return {'ok': false, 'mensaje': decodeRes['error']['message']};
    }
  }
}
