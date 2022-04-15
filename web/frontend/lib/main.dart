import 'package:devspace/ui/pages/blog.dart';
import 'package:devspace/ui/pages/drawTest.dart';
import 'package:devspace/ui/pages/landing.dart';
import 'package:devspace/ui/pages/landing2.dart';
import 'package:devspace/ui/pages/report.dart';
import 'package:devspace/ui/pages/signIn.dart';
import 'package:devspace/ui/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'allie',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              headline1: GoogleFonts.poppins(fontSize: 72, color: Colors.black),
              button: GoogleFonts.poppins(color: Colors.black)),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff133A3A),
                  ),
                  borderRadius: BorderRadius.circular(14))),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  textStyle: MaterialStateProperty.all(GoogleFonts.poppins(
                      fontSize: 72, color: Colors.black))))),
      home: Landing(),
    );
  }
}
