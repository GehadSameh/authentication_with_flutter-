import 'package:authentication/core/api/api_consumer.dart';
import 'package:authentication/core/api/end_points.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer{
  final Dio dio;

  DioConsumer({required this.dio}){
dio.options.baseUrl=EndPoints.baseUrl;
dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
  }
  
  @override
  Future delete({required String path, Object? data, Map<String,dynamic>? queryParamters, bool isFormData = false}) {
    
    throw UnimplementedError();
  }
  
  @override
  Future get({required String path, Object? data, Map<String,dynamic>? queryParamters, bool isFormData = false}) {
    
    throw UnimplementedError();
  }
  
  @override
  Future patch({required String path, Object? data, Map<String,dynamic>? queryParamters, bool isFormData = false}) {
    
    throw UnimplementedError();
  }
  
  @override
  Future post({required String path, Object? data, Map<String,dynamic>? queryParamters, bool isFormData = false}) async{
    
    try{
      final Response=await dio.post(path,data: data,queryParameters: queryParamters);
    return Response.data;
    }catch(e){
      e.toString();
    }
  }

}