import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Syn extends ChangeNotifier {
  final String api = "blockchain-api-eosin.vercel.app";

  Future<void> synthmint() async {
    var url = Uri.https(api, "/mint/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<List<String>> data() async {
    var url = Uri.https(api, "/getTotal/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return [
        jsonResponse['totalSUSDSupply'],
        jsonResponse['totalSBTCSupply'],
        jsonResponse['totalSETHSupply']
      ];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return ["Error", "Error", "Error"];
    }
  }
}
