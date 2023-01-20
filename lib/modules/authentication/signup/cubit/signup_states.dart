abstract class SignUpStates{}

class SignUpInitialState extends SignUpStates{}

class RegisterLoadingState extends SignUpStates{}
class RegisterSuccessState extends SignUpStates{

}
class RegisterErrorState extends SignUpStates{
  late final dynamic error;
  RegisterErrorState(this.error);
}