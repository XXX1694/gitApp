import 'dart:convert';
import 'package:fit_app/common/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class UserAuthRepository {
  userLogIn(String username, String password) async {
    // get data from storage
    final storage = await _storage;

    // create url
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
        if (kDebugMode) {
          print('User Auth: Token saved - ${data['auth_token']}');
        }
        return data;
      }
    }
  }

  isUserOnline() async {
    final storage = await _storage;
    final isOnline = storage.getString(tokenKey);
    if (isOnline != null) {
      return true;
    }
  }

  gerUserID() async {
    // get data from phone storage
    final storage = await _storage;
    final token = storage.getString(tokenKey);

    // create url
    String finalUrl = '${mainUrl}users/get_id/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.post(
        uri,
        headers: {'Authorization': 'Token $token'},
      );

      if (res.statusCode == 200) {
        // status code 200 ---- OK
        final data = json.decode(res.body);

        // save user id in phone storage
        storage.setInt(idKey, data['user_id']);

        if (kDebugMode) {
          print('set id: ${data['user_id']}');
        }
        return data;
      }
    }
  }
}
