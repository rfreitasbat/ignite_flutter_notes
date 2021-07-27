import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes/modules/login/model/user_model.dart';

abstract class LoginService {
  Future<UserModel> googleSifnIn();
}

class LoginServiceImpl implements LoginService {
  @override
  Future<UserModel> googleSifnIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    final account = await _googleSignIn.signIn();
    return UserModel.google(account!);
  }
}
