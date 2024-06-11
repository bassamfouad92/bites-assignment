class LoginRequest {
  final String email;
  final String password;
  LoginRequest(this.email, this.password);

  Map<String, dynamic> params() => {
        'username': email.trim().toString(),
        'password': password.trim().toString(),
      };
}
