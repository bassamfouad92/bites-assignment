import 'package:bites_assignment/common/base/base_usecase.dart';
import 'package:bites_assignment/login/domain/login_request.dart';
import 'package:bites_assignment/login/ui/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  final UseCase useCase;

  LoginViewModel(this.useCase) : super(const LoginState.initial());

  void inputEmail(String email) {
    state = state.copyWith(
      email: email,
      canSubmit: email.isNotEmpty && state.password.isNotEmpty,
    );
  }

  void inputPassword(String password) {
    state = state.copyWith(
      password: password,
      canSubmit: state.email.isNotEmpty && password.isNotEmpty,
    );
  }

  Future<LoginState> loginUser() async {
    try {
      final isSuccess =
          await useCase.execute(LoginRequest(state.email, state.password));
      if (isSuccess) {
        state = state.copyWith(state: LoginConcreteState.loaded);
        return state;
      }
    } catch (ex) {
      state = state.copyWith(state: LoginConcreteState.failure);
      return state;
    }
    return state;
  }
}
