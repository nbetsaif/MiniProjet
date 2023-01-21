import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/layout_screen.dart';
import 'package:mini_projet/modules/authentication/signin/cubit/signin_cubit.dart';
import 'package:mini_projet/modules/authentication/signin/cubit/signin_states.dart';
import 'package:mini_projet/modules/authentication/signup/signup_screen.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_form_field.dart';

class SignInScreen extends StatefulWidget {
  final bool isClient;
  const SignInScreen({required this.isClient,Key? key}) : super(key: key);


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    return BlocProvider(
        create: (context) => SignInCubit(),
        child: BlocConsumer<SignInCubit,SignInStates>(
          listener: (context, state) {
            print(state);
          },
          builder: (context, state) {
            SignInCubit cubit=SignInCubit.get(context);
            return Scaffold(
              body: Form(
                key: formKey,
                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: height10 * 3.6),
                        Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                        SizedBox(height: height10 * 3),
                        Image.asset(
                          'assets/images/logo.png',
                          width: width10 * 10,
                          height: height10 * 10,
                        ),
                        SizedBox(height: height10 * 3),
                        Text(
                          "Add your details to login",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 15, color: Colors.black26),
                        ),
                        SizedBox(height: height10 * 3),
                        CustomFormField(
                          isEmail: true,
                          validator: cubit.emailValidator,
                          controller:cubit.email ,
                          hintText: "Your email",
                          prefixIcon: Icons.email,
                        ),
                        SizedBox(height: height10 * 3),
                        CustomFormField(
                          validator: cubit.passwordValidator,
                          controller: cubit.password,
                          hintText: "Password",
                          prefixIcon: Icons.lock,
                          isPassword: true,
                        ),
                        SizedBox(height: height10 * 3),
                        //loginButton
                        state is LoginLoadingState ==true?
                        CircularProgressIndicator(color: Colors.black,):CustomButton(
                          height: height10 * 5,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(context,email: cubit.email.text, password:cubit.password.text, isClient: widget.isClient);
                            }
                          },
                          buttonText: "Login",
                          margin:
                              EdgeInsets.symmetric(horizontal: height10 * 3.6),
                        ),
                        SizedBox(
                          height: height10 * 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an Account ?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 15, color: Colors.black),
                              ),
                              MaterialButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(isClient: widget.isClient),));
                                },
                                child: Text(
                                  " Sign Up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
