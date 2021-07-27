import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacementNamed(context, "/login");
    } catch (e) {}
  }

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            "Notes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
