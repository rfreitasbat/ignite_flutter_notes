import 'package:flutter/material.dart';
import 'package:notes/modules/login/login_service.dart';
import 'package:notes/modules/login/login_state.dart';
import 'package:notes/modules/login/model/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;
  final LoginService service;
  Function(LoginState state)? onChange;

  LoginController({required this.onUpdate, required this.service});

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      final user = await service.googleSifnIn();
      state = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      state = LoginStateFailure(massage: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(state);
    }
  }

  void Listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
