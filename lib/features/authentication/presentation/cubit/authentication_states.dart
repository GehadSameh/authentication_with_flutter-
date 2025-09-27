
class AuthenticationStates {}
class InitialState extends AuthenticationStates{}
class LoadingSignInState extends AuthenticationStates{}
class SuccessSignInState extends AuthenticationStates{}
class FailureSignInState extends AuthenticationStates{
  final String message;


  FailureSignInState({required this.message});}

  class LoadingSignUpState extends AuthenticationStates{}
class SuccessSignUpState extends AuthenticationStates{
  final String message;

  SuccessSignUpState({required this.message});
}
class UploadingImageState extends AuthenticationStates{}
class FailureSignUpState extends AuthenticationStates{
  final String errormessage;


  FailureSignUpState({required this.errormessage});}