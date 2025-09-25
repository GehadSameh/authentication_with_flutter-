abstract class ApiConsumer {
  Future<dynamic>get({required String path, Object?data,Map<String,dynamic>?queryParamters,bool isFormData=false});
  Future<dynamic>post({required String path, Object?data,Map<String,dynamic>?queryParamters,bool isFormData=false});
  Future<dynamic>delete({required String path, Object?data,Map<String,dynamic>?queryParamters,bool isFormData=false});
  Future<dynamic>patch({required String path, Object?data,Map<String,dynamic>?queryParamters,bool isFormData=false});
}