import '../../../../models/user_model.dart';

abstract class SignInStates{}

class SignInInitialState extends SignInStates{}

class LoginLoadingState extends SignInStates{}

class LoginSuccessState extends SignInStates{
  late final UserModel userModel;
  LoginSuccessState(this.userModel);
}

class LoginErrorState extends SignInStates{
  final String error;
  LoginErrorState(this.error);
}