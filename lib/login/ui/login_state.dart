enum LoginConcreteState {
  loading,
  loaded,
  failure,
}

class LoginState {
  final String email;
  final String password;
  final bool canSubmit;
  final LoginConcreteState state;

  const LoginState({
    this.email = '',
    this.password = '',
    this.canSubmit = false,
    this.state = LoginConcreteState.loading,
  });

  const LoginState.initial()
      : email = '',
        password = '',
        canSubmit = false,
        state = LoginConcreteState.loading;

  LoginState copyWith({
    String? email,
    String? password,
    bool? canSubmit,
    LoginConcreteState? state,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      canSubmit: canSubmit ?? this.canSubmit,
      state: state ?? this.state,
    );
  }
}
