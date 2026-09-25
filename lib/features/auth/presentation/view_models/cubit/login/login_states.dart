enum LoginStatus {
  initial,
  changeEmail,
  changePassword,
  loadingLogin,
  successLogin,
  failedLogin
}

class LoginStates {
  final LoginStatus status;
  final String email;
  final String password;
  final String? errorMessage;

  const LoginStates({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.errorMessage
  });

  LoginStates copyWith(
      LoginStatus status, {
      String? email,
      String? password,
      String? errorMessage
  }) => LoginStates(
    status: status,
    email: email ?? this.email,
    password: password ?? this.password,
    errorMessage: errorMessage ?? this.errorMessage
  );
}

