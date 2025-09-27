import 'dart:io';
import 'dart:typed_data';

import 'package:authentication/core/api/api_consumer.dart';
import 'package:authentication/core/api/end_points.dart';
import 'package:authentication/core/data_base/cache_helper.dart';
import 'package:authentication/core/errors/handle_exceptions.dart';
import 'package:authentication/features/authentication/data/models/sign_in_model.dart';
import 'package:authentication/features/authentication/data/models/sign_up_model.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});
 Future<Either<String ,SignInModel>> signIn({required String email,required String password})async{
    try{
        
        final response=await api.post(path:EndPoints.signIn,data: {
     ApiKeys.email:email,
     ApiKeys.password:password

        } );
        SignInModel user=SignInModel.fromJson(response);
        final token=JwtDecoder.decode(user.token);
        SharedPref.storedata(key: ApiKeys.token, value:user.token );
        SharedPref.storedata(key: ApiKeys.id, value:token[ApiKeys.id] );
        
return Right(user) ;
    }on ServerExceptions catch(e){
        
        return left(e.errorModel.errorMessage);
        
    }
}

Future<Either<String,SignUpModel>> signUp({
  required String email,
  required String password,
  required String name,
  required String phone,
  required String confirmPassword,
  required Uint8List profilePic,
   required Map location,
   

  })async{
  try{
final Response=await api.post(path:EndPoints.signup,data: {
  ApiKeys.email:email,
  ApiKeys.password:password,
  ApiKeys.name:name,
  ApiKeys.phone:phone,
  ApiKeys.location:location,
  ApiKeys.profilePic:profilePic,
  ApiKeys.confirmPassword:confirmPassword
} ,isFormData: true,) ;
return Right(SignUpModel.fromJson(Response));
  }
 on ServerExceptions catch(e){
  return left(e.errorModel.errorMessage);
  
 }
}
}