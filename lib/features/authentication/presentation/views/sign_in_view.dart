import 'package:authentication/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:authentication/features/authentication/presentation/cubit/authentication_states.dart';
import 'package:authentication/features/authentication/presentation/views/sign_up_view.dart';
import 'package:authentication/features/authentication/presentation/widgets/custom_TextFrom.dart';
import 'package:authentication/features/authentication/presentation/widgets/secret_textForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationStates>(
       listener: (BuildContext context, AuthenticationStates state) { 
        if(state is SuccessSignInState){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('success')));
              }else  if(state is FailureSignInState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              }
        },
      builder: (BuildContext context, AuthenticationStates state) {  
     
      return Scaffold(
        body: SingleChildScrollView(
            child:  Column(
                children: [
                  Image.asset(
                    "assets/login.gif",
                    height: 300,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CustomTextfrom(
                    labelText: "Email",
                    controller: context.read<AuthenticationCubit>().email,
                    fKey:context.read<AuthenticationCubit>().fKey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecretTextform(
                    labelText: "Password",
                    controller: context.read<AuthenticationCubit>().pass,
                    fKey: context.read<AuthenticationCubit>().fKeyP,
                     controller_parent: null,
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("if you don't have an account"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpView()));
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                  state is LoadingSignInState?const CircularProgressIndicator():
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      context.read<AuthenticationCubit>().signIn();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
        )));
    },);
         
        
    
  
}}