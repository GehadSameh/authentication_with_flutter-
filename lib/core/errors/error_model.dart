class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(json){
    return ErrorModel(status: json['status'], errorMessage: json['ErrorMessage']);
  }
}