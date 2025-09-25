class AuthenticationStates {}
class InitialState extends AuthenticationStates{}
class LoadingSignInState extends AuthenticationStates{}
class SuccessSignInState extends AuthenticationStates{}
class FailureSignInState extends AuthenticationStates{
  final String message;


  FailureSignInState({required this.message});}