import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  final String api = "blockchain-api-eosin.vercel.app/";

  void synthmint() async {
    var url = Uri.https(api, "/test/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
