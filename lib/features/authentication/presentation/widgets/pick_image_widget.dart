import 'dart:io';
import 'dart:typed_data';

import 'package:authentication/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:authentication/features/authentication/presentation/cubit/authentication_states.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit,AuthenticationStates>(
      builder: (BuildContext context, state) {  
      return SizedBox(
        width: 130,
        height: 130,
        child:context.read<AuthenticationCubit>().profilePic==null? CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          backgroundImage:const AssetImage("assets/avatar.png"),
          child: Stack(
            children: [
              Positioned(
                bottom: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
  type: FileType.image,
);
if (result != null) {
  final path = result.files.first.path!;
  File file = File(path);
  Uint8List fileBytes = await file.readAsBytes();
  

  context.read<AuthenticationCubit>().uploadProfilePIC(fileBytes);
}


                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ):CircleAvatar(backgroundImage: MemoryImage(context.read<AuthenticationCubit>().profilePic!))
      );},
    );
  }
}
