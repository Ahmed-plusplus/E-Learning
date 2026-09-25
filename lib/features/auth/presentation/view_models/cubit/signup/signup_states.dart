enum SignupStatus {
  initial,
  changeFullName,
  changeEmail,
  changePassword,
  loadingSignup,
  successSignup,
  failedSignup
}

class SignupStates {
  final SignupStatus status;
  final String fullName;
  final String email;
  final String password;
  final String? errorMessage;

  const SignupStates({
    this.status = SignupStatus.initial,
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.errorMessage
  });

  SignupStates copyWith(
      SignupStatus status, {
      String? fullName,
      String? email,
      String? password,
      String? errorMessage
  }) => SignupStates(
    status: status,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    password: password ?? this.password,
    errorMessage: errorMessage ?? this.errorMessage
  );
}

