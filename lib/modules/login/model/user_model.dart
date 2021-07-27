import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String? name;
  final String email;
  final String? photoUrl;
  final String id;

  UserModel({
    this.name,
    required this.email,
    this.photoUrl,
    required this.id,
  });

  factory UserModel.google(GoogleSignInAccount account) {
    return UserModel(
        name: account.displayName,
        email: account.email,
        photoUrl: account.photoUrl,
        id: account.id);
  }
}
