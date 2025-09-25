import 'package:authentication/core/api/dio_consumer.dart';
import 'package:authentication/core/data_base/cache_helper.dart';
import 'package:authentication/features/authentication/data/repositories/user_repository.dart';
import 'package:authentication/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:authentication/features/authentication/presentation/views/sign_in_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AuthenticationCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInView(),
      ),
    );}}
      