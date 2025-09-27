import 'package:authentication/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:authentication/features/authentication/presentation/cubit/authentication_states.dart';
import 'package:authentication/features/authentication/presentation/widgets/already_have_an_account_widget.dart';
import 'package:authentication/features/authentication/presentation/widgets/custom_form_button.dart';
import 'package:authentication/features/authentication/presentation/widgets/custom_input_field.dart';
import 'package:authentication/features/authentication/presentation/widgets/page_header.dart';
import 'package:authentication/features/authentication/presentation/widgets/page_heading.dart';
import 'package:authentication/features/authentication/presentation/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: BlocConsumer<AuthenticationCubit,AuthenticationStates>(
          listener: (BuildContext context, state) { 
            if(state is SuccessSignUpState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }else if(state is FailureSignUpState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errormessage)));
            }
           },
          builder: (BuildContext context, Object? state) {  
          return SingleChildScrollView(
            child: Form(
              key: context.read<AuthenticationCubit>().fKeyn,
              child: Column(
                children: [
                  const PageHeader(),
                  const PageHeading(title: 'Sign-up'),
                  //! Image
                  const PickImageWidget(),
                  const SizedBox(height: 16),
                  //! Name
                  CustomInputField(
                    labelText: 'Name',
                    hintText: 'Your name',
                    isDense: true,
                    controller: context.read<AuthenticationCubit>().nameup,
                  ),
                  const SizedBox(height: 16),
                  //!Email
                  CustomInputField(
                    labelText: 'Email',
                    hintText: 'Your email',
                    isDense: true,
                    controller: context.read<AuthenticationCubit>().emailup,
                  ),
                  const SizedBox(height: 16),
                  //! Phone Number
                  CustomInputField(
                    labelText: 'Phone number',
                    hintText: 'Your phone number ex:01234567890',
                    isDense: true,
                    controller: context.read<AuthenticationCubit>().phoneup,
                  ),
                  const SizedBox(height: 16),
                  //! Password
                  CustomInputField(
                    labelText: 'Password',
                    hintText: 'Your password',
                    isDense: true,
                    obscureText: true,
                    suffixIcon: true,
                    controller: context.read<AuthenticationCubit>().passup,
                  ),
                  //! Confirm Password
                  CustomInputField(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Your password',
                    isDense: true,
                    obscureText: true,
                    suffixIcon: true,
                    controller: context.read<AuthenticationCubit>().cpassup,
                  ),
                  const SizedBox(height: 22),
                  //!Sign Up Button
                state is LoadingSignUpState?CircularProgressIndicator():  CustomFormButton(
                    innerText: 'Signup',
                    onPressed: () {
                      context.read<AuthenticationCubit>().signUp();
                    },
                  ),
                  const SizedBox(height: 18),
                  //! Already have an account widget
                  const AlreadyHaveAnAccountWidget(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );},
        ),
      ),
    );
  }
}
