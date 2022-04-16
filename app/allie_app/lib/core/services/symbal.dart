import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import "dart:io";

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Symbal extends ChangeNotifier {
  final String api = "allie-backend.herokuapp.com";
  bool busy = true;

  Symbal();

  void generateSummary() async {
    var url = Uri.https(api, "/summary/");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access');

    var request = MultipartRequest(
      'POST',
      url,
    );

    Map<String, String> headers = {'bearer': token!};

    request.files.add(await MultipartFile.fromPath(
      'audio',
      '/sdcard/Download/temp.wav',
    ));

    request.headers.addAll(headers);

    var res = await request.send();

    String yo = await res.stream.bytesToString();
    Map data = convert.jsonDecode(yo);
    print(data);

    notifyListeners();
  }

  void history() async {
    var url = Uri.https(api, "/summaryhistory/");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access');

    var response = await http.get(
      url, headers: {"Authorization": "Bearer ${token!}"},
      // headers: {
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Headers": "Content-Type",
      //   "Referrer-Policy": "no-referrer-when-downgrade"
      // }
    );
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      print(jsonResponse);
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
