import 'package:notes/modules/login/model/user_model.dart';

abstract class LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateFailure extends LoginState {
  final String massage;
  LoginStateFailure({required this.massage});
}

class LoginStateSuccess extends LoginState {
  final UserModel user;
  LoginStateSuccess({required this.user});
}
