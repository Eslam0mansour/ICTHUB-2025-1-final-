abstract class AuthStates {}

class AuthIntialState extends AuthStates {}

class PasswordVisibilyChanged extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterErrorState extends AuthStates {
  final String errMsg;

  RegisterErrorState({required this.errMsg});

}
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String errMsg;

  LoginErrorState({required this.errMsg});

}
class LogoutLoadingState extends AuthStates {}

class LogoutSuccessState extends AuthStates {}

class LogoutErrorState extends AuthStates {
  final String errMsg;

  LogoutErrorState({required this.errMsg});

}
