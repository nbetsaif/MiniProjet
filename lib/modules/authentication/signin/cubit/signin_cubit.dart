import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/modules/authentication/signin/cubit/signin_states.dart';

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

  void userLogin({required String email, required String password}){
    emit(LoginLoadingState());
    DioHelper.postData
      (url: 'login',
        data:
        {
          'email':email,
          'password':password
        }
    ).then(
            (value) {
          userModel=UserModel.fromJson(value.data);
          emit(LoginSuccessState(userModel));
        }
    ).catchError(
            (error){
          print(error.toString());
          emit(LoginErrorState(error));
        });

  }




}