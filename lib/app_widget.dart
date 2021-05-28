import 'package:flutter/material.dart';
import 'package:notes/create_edit_note_page.dart';
import 'package:notes/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: "Notes",
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/create-edit-note": (context) => CreateEditNotePage(),
      },
    );
  }
}
