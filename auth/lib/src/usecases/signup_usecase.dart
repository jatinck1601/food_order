import 'package:auth/src/domain/signup_service_contract.dart';
import 'package:async/async.dart';
import '../domain/token.dart';


class SignInUseCase {
  final ISignUpService _signUpService;
  SignInUseCase(this._signUpService);

  Future<Result<Token>> execute(
      String name,
      String email,
      String password,
      ) async {
    return await _signUpService.signUp(name,email,password);
  }
}