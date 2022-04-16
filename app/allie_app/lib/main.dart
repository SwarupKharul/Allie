import 'package:allie_app/ui/pages/landing.dart';
import 'package:allie_app/ui/pages/signIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/services/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Auth(),
      builder: (context, child) => MaterialApp(
        title: 'allie',
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xffF1F1EA),
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
                headline1:
                    GoogleFonts.poppins(fontSize: 72, color: Colors.black),
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
        home: Consumer<Auth>(
          builder: (context, value, child) {
            if (value.state == authState.login)
              return Landing(
                auth: value,
              );
            else
              //return Landing();
              return SignInPage(auth: value);
          },
        ),
      ),
    );
  }
}
