import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/modules/authentication/signin/cubit/signin_states.dart';
import 'package:mini_projet/shared/constants/constants.dart';

import '../../../../layout/layout_screen.dart';
import '../../../../models/user_model.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class SignInCubit extends Cubit<SignInStates>{

  SignInCubit() : super(SignInInitialState());
  static SignInCubit get(context)=>BlocProvider.of(context);
  final email = TextEditingController();
  final password = TextEditingController();
  late UserModel userModel;

  String? emailValidator(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^[\w-\,]+@([\w-]+\.)+[\w]{2,5}').hasMatch(value)) {
      return "Enter correct email";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^(?=.*[0-9a-zA-Z]).{6,}$').hasMatch(value)) {
      return "Enter correct password";
    }
    return null;
  }

  void userLogin(context,{required String email, required String password,required bool isClient}){
    emit(LoginLoadingState());
    DioHelper.postData
      (url:isClient==true?"client/signin":"merchant/signin",
        data:
        {
          'email':email,
          'password':password
        }
    ).then(
            (value) {
              token=value.data['existingUser']['_id'];

          emit(LoginSuccessState());
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LayoutScreen(isClient: isClient),));

            }
    ).catchError(
            (error){
          print(error.toString());
          emit(LoginErrorState(error.toString()));
        });

  }




}