import 'dart:convert';
import 'package:fit_app/common/constants.dart';
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
    String finalUrl1 = '${mainUrl}auth/token/login/';
    Uri? uri = Uri.tryParse(finalUrl);
    Uri? urii = Uri.tryParse(finalUrl1);

    if (uri != null && urii != null) {
      var res = await http.post(
        uri,
        headers: {},
        body: {
          'username': username,
          'password': password,
        },
      );
      var res1 = await http.post(
        urii,
        headers: {},
        body: {
          'username': username,
          'password': password,
        },
      );
      if (res.statusCode == 201) {
        // status code 200 ---- OK
        final data = json.decode(res.body);
        storage.setInt(idKey, data['id']);
        if (kDebugMode) {
          print('Registration: User with id ${data['id']} created');
        }
        if (res1.statusCode == 200) {
          final data1 = json.decode(res1.body);
          storage.setString(tokenKey, data1['auth_token']);
          if (kDebugMode) {
            print('Registration: Token ${data1['auth_token']} saved');
          }
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

    if (kDebugMode) {
      print('Registration: User $id will edit');
      print('first_name: $firstName');
      print('last_name: $lastName');
      print('birth_date: $birthDate');
      print('phone: $number');
      print('email: $email');
      print('gender: $sex');
    }
    if (uri != null) {
      // patch to edit user
      final res = await http.put(
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
      if (res.statusCode == 200) {
        // status code 200 ---- OK
        final data = json.decode(res.body);
        return data;
      } else if (res.statusCode == 400) {
        // status code 200 ---- Bad request
        final data = json.decode(res.body);
        return data;
      }
    }
  }

  clientCreate() async {
    final storage = await _storage;
    final id = storage.getInt(idKey);
    final token = storage.get(tokenKey);

    // creating url
    String finalUrl = '${mainUrl}api/mobile/client/create/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      // patch to edit user
      final res = await http.post(
        uri,
        headers: {'Authorization': 'Token $token'},
      );
      if (res.statusCode == 201) {
        // status code 201 ---- Created
        final data = json.decode(res.body);
        storage.setInt(clientKey, data['id']);
        if (kDebugMode) {
          print('Client create with id: ${data['id']}');
        }
        return data;
      }
    }
  }
}
