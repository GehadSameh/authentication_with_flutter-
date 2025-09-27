import 'dart:typed_data';

import 'package:authentication/features/authentication/data/repositories/user_repository.dart';
import 'package:authentication/features/authentication/presentation/cubit/authentication_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit(this.userRepository):super(InitialState());
  final UserRepository userRepository;

TextEditingController email = TextEditingController();
  
  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> fKeyP = GlobalKey<FormState>();
 
 
  TextEditingController emailup = TextEditingController();
  
  TextEditingController passup = TextEditingController();
  
  TextEditingController cpassup = TextEditingController();
  GlobalKey<FormState> cfKeyP = GlobalKey<FormState>();

  TextEditingController nameup = TextEditingController();
  GlobalKey<FormState> fKeyn = GlobalKey<FormState>();
  TextEditingController phoneup = TextEditingController();
  GlobalKey<FormState> fKeyph = GlobalKey<FormState>();
  Uint8List? profilePic;
 
  uploadProfilePIC(Uint8List image){
  profilePic = image;
 
  emit(UploadingImageState());
}


signIn()async{
  final Response=await userRepository.signIn(email: email.text, password: pass.text);
  Response.fold((error)=>emit(FailureSignInState(message: error))
  ,( usermodel)=>emit(SuccessSignInState()));
}

signUp()async{
  final Response=await userRepository.signUp(email: emailup.text,
   password: passup.text, 
   name: nameup.text, 
   phone: phoneup.text,


    confirmPassword: cpassup.text, 
    profilePic:profilePic!, location: {"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]});
    Response.fold((error)=>emit(FailureSignUpState(errormessage:error)),
     (SignUpModel)=>emit(SuccessSignUpState(message: SignUpModel.message)));
}

}