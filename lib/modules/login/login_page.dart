import 'package:flutter/material.dart';
import 'package:notes/modules/login/login_controller.dart';
import 'package:notes/modules/login/login_service.dart';
import 'package:notes/modules/login/login_state.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
        service: LoginServiceImpl(),
        onUpdate: () {
          if (controller.state is LoginStateSuccess) {
            final user = (controller.state as LoginStateSuccess).user;
            Navigator.pushReplacementNamed(context, "/home", arguments: user);
          } else {
            setState(() {});
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "Notes",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Text("Entrar com email google"),
              ),
              Container(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: Icon(Icons.email),
                    onPressed: () async {
                      controller.googleSignIn();
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
