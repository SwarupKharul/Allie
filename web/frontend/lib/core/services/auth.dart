import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';

class Auth extends ChangeNotifier {
  final String api = "allie-backend.herokuapp.com";

  void register(String email, String password) async {
    var url = Uri.https(api, "/register");

    var response = await http.post(url, body: {
      "email": email,
      "password": password
    }, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Content-Type",
      "Referrer-Policy": "no-referrer-when-downgrade"
    });
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // var itemCount = jsonResponse['totalItems'];
      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
