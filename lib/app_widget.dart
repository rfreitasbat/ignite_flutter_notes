import 'package:flutter/material.dart';
import 'package:notes/modules/create_edit_note.dart/create_edit_note_page.dart';
import 'package:notes/modules/home/home_page.dart';
import 'package:notes/modules/login/login_page.dart';
import 'package:notes/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: "Notes",
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(),
        "/create-edit-note": (context) => CreateEditNotePage(),
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
