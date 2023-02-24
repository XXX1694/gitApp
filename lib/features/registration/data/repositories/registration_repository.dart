import 'dart:convert';
import 'package:fit_app/common/constants.dart';
import 'package:fit_app/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class RegistrationRepository {
  createUser(String username, String password) async {
    // taking data from phone storage
    final storage = await _storage;

    // creating url
    String finalUrl = '${mainUrl}auth/users/';
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
        storage.setInt(idKey, data['id']);
        if (kDebugMode) {
          print('Registration: User with id ${data['id']} created');
        }
        return data;
      }
    }
  }

  editProfile(String firstName, String lastName, String birthDate, String sex,
      String number, String email) async {
    // taking data from phone storage
    final storage = await _storage;
    final id = storage.getInt(idKey);
    final token = storage.get(tokenKey);

    // creating url
    String finalUrl = '${mainUrl}users/$id/update/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      // patch to edit user
      var res = await http.patch(
        uri,
        headers: {'Authorization': 'Token $token'},
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'birth_date': birthDate,
          'phone': number,
          'email': email,
          'gender': sex,
          'is_client': 'true',
        },
      );
    }
  }
}
