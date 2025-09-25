class SignInModel {
  final  String token;
  final String message;

  SignInModel({required this.token, required this.message});
  factory SignInModel.fromJson(json){
    return SignInModel(token: json['token'], message: json['message']);
  }
}