import 'package:student_application/data/api/authentication/authentication_api.dart';
import 'package:student_application/data/models/login_models.dart';

class AuthenticationRepo {
  final login = AuthenticationApi();
  Future<LoginModel> loginUser(
      {required String email, required String password}) {
    return login.login(email: email, password: password);
  }
}
