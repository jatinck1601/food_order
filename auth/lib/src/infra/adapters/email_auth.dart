import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/auth_service_contract.dart';
import '../../domain/signup_service_contract.dart';
import '../../domain/token.dart';
import '../../infra/api/auth_api_contract.dart';
import '../../do../../domain/credential.dart';

class EmailAuth implements IAuthService, ISignUpService {
  void credential({
    @required String email,
    @required String password,
  }) {
    _credential = Credential(
      type: AuthType.email,
      email: email,
      password: password,
    );
  }

  @override
  final IAuthApi _api;
  EmailAuth(this._api);
  Credential _credential;

  @override
  Future<Result<Token>> signIn() async {
    assert(_credential != null);
    var result = await _api.signIn(_credential);
    if (result.isError) return result.asError;
    return Result.value(Token(result.asValue.value));
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<Token>> signUp(
      String name, String email, String password) async {
    // TODO: implement signUp
    Credential credential = Credential(
      type: AuthType.email,
      email: email,
      name: name,
      password: password,
    );

    var result = await _api.signUp(credential);
    if (result.isError) return result.asError;
    return Result.value(Token(result.asValue.value));
  }
}
