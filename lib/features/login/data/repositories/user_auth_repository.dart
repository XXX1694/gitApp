import 'dart:convert';
import 'package:fit_app/common/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class UserAuthRepository {
  userLogIn(String username, String password) async {
    final storage = await _storage;
    String finalUrl = '${mainUrl}auth/token/login/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.post(
        uri,
        headers: {},
        body: {
          'username': username,
          'password': password,
        },
      );
      if (res.statusCode == 200) {
        // status code 200 ---- OK
        final data = json.decode(res.body);
        storage.setString(tokenKey, data['auth_token']);
        return true;
      } else {
        return false;
      }
    }
  }
}
