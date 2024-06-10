import 'package:bites_assignment/common/base/base_usecase.dart';
import 'package:bites_assignment/login/data/auth_repository.dart';
import 'package:bites_assignment/login/domain/login_request.dart';

class LoginUsecase extends UseCase<bool, LoginRequest> {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  @override
  Future<bool> execute(LoginRequest params) async {
    try {
      return _authRepository.login(
          params.email.trim().toString(), params.password.trim().toString());
    } catch (ex) {
      rethrow;
    }
  }
}
