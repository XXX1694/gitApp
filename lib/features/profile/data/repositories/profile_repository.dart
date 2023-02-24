import 'dart:convert';
import 'package:fit_app/common/constants.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class ProfileRepository {
  getProfileData() async {
    // get data from phone storage
    final storage = await _storage;
    final id = storage.getInt(idKey);
    final token = storage.getString(tokenKey);

    // create url
    String finalUrl = '${mainUrl}api/clients/$id/profile/';
    Uri? uri = Uri.tryParse(finalUrl);

    // request
    if (uri != null) {
      var res = await http.get(
        uri,
        headers: {'Authorization': 'Token $token'},
      );
      final data = json.decode(res.body);
      if (kDebugMode) {
        print(data);
      }
      return data;
    }
  }
}
