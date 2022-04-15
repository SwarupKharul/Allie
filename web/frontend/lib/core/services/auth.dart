import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  final String api = "allie-backend.herokuapp.com";
  authState state = authState.logout;

  Auth() {
    init();
  }

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("access")) {
      state = authState.login;
      notifyListeners();
    }
  }

  void register(String email, String password) async {
    var url = Uri.https(api, "/register/");

    var response = await http.post(
      url, body: {"email": email, "password": password},
      // headers: {
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Headers": "Content-Type",
      //   "Referrer-Policy": "no-referrer-when-downgrade"
      // }
    );
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access', jsonResponse['access']);
      prefs.setString('refresh', jsonResponse['refresh']);
      // var itemCount = jsonResponse['totalItems'];
      print(jsonResponse);
      state = authState.login;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void login(String email, String password) async {
    var url = Uri.https(api, "/login/");

    var response = await http.post(
      url, body: {"email": email, "password": password},
      // headers: {
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Headers": "Content-Type",
      //   "Referrer-Policy": "no-referrer-when-downgrade"
      // }
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // var itemCount = jsonResponse['totalItems'];
      print(jsonResponse);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access', jsonResponse['access']);
      prefs.setString('refresh', jsonResponse['refresh']);
      state = authState.login;
      notifyListeners();
    } else {
      print(response);
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void logout() async {
    var url = Uri.https(api, "/logout/");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('refresh');
    var response = await http.post(
      url,
      body: {
        "refresh": token,
      },
      // headers: {
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Headers": "Content-Type",
      //   "Referrer-Policy": "no-referrer-when-downgrade"
      // }
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('access');
      prefs.remove('refresh');
      state = authState.logout;
      notifyListeners();
      // var itemCount = jsonResponse['totalItems'];
      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

enum authState {
  login,
  logout,
}
