import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/modules/authentication/signup/cubit/signup_states.dart';

import '../../../../layout/layout_screen.dart';
import '../../../../models/user_model.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class SignUpCubit extends Cubit<SignUpStates>{

  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(context)=>BlocProvider.of(context);
  final name=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  final confirmPassword=TextEditingController();
  final phone=TextEditingController();

  String? nameValidator(String? value){
    if(value!.isEmpty||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
      return "Enter correct name";
    }
    return null;
  }
  String? phoneValidator(String? value){
    if(value!.isEmpty||!RegExp(r'^((\+|00)216)?(7|9|4|2|5)[0-9]{7}').hasMatch(value)){
      return "Enter correct phone number";
    }
    return null;
  }
  String?  emailValidator(String? value){
    if(value!.isEmpty||!RegExp(r'^[\w-\,]+@([\w-]+\.)+[\w]{2,5}').hasMatch(value)){
      return "Enter correct email";
    }
    return null;
  }
  String? passwordValidator(String? value){
    if(value!.isEmpty||!RegExp(r'^(?=.*[0-9a-zA-Z]).{6,}$').hasMatch(value)){
      return "Enter correct password";
    }
    return null;
  }
  String? confirmPasswordValidator(String? value){
    if(password.text!=value){
      return "Password do not match";
    }
    return null;
  }

  late UserModel userModel;
  void register(context,{required email , required name, required phone , required password,required bool isClient})
  {
    emit(RegisterLoadingState());
    DioHelper.postData(url:isClient==true? "client/signup":"merchant/signup", data: {'name':name,'email':email,'phone':phone,'password':password}).then((value) {
      print(value);
      emit(RegisterSuccessState());
      userModel=UserModel.fromJson(value.data['newUser']);
      token=value.data['newUser']['_id'];
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LayoutScreen(isClient: isClient,userData: userModel),));

    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}