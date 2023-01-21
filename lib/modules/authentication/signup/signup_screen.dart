import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/layout_screen.dart';
import 'package:mini_projet/modules/authentication/signin/signin_screen.dart';
import 'package:mini_projet/modules/authentication/signup/cubit/signup_cubit.dart';
import 'package:mini_projet/modules/authentication/signup/cubit/signup_states.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_form_field.dart';

class SignUpScreen extends StatefulWidget {
  final bool isClient;
  const SignUpScreen({required this.isClient,Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double height10 = screenHeight / 82;
    double width10 = screenWidth / 41;
    return BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
            listener: (context, state) {},
            builder: (context, state) {
              SignUpCubit cubit = SignUpCubit.get(context);
              return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: height10 * 3.6),
                          Text(
                            "Sign Up",
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
                            "Add your details to Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 15, color: Colors.black26),
                          ),
                          SizedBox(height: height10 * 3),
                          CustomFormField(
                            isName: true,
                            controller: cubit.name,
                            validator: cubit.nameValidator,
                            hintText: "Name",
                            prefixIcon: Icons.person,
                          ),
                          SizedBox(
                            height: height10 * 2.8,
                          ),
                          CustomFormField(
                            isEmail: true,
                            controller: cubit.email,
                              validator: cubit.emailValidator,
                              hintText: "Email", prefixIcon: Icons.email),
                          SizedBox(
                            height: height10 * 2.8,
                          ),
                          CustomFormField(
                            isPhone: true,
                            validator: cubit.phoneValidator,
                            controller: cubit.phone,
                              hintText: "Mobile No",
                              prefixIcon: Icons.phone_android),
                          SizedBox(
                            height: height10 * 2.8,
                          ),
                          CustomFormField(
                            controller: cubit.password,
                            validator: cubit.passwordValidator,
                            hintText: "Password",
                            prefixIcon: Icons.lock,
                            isPassword: true,
                          ),
                          SizedBox(
                            height: height10 * 2.8,
                          ),
                          CustomFormField(
                            controller: cubit.confirmPassword,
                            validator: cubit.confirmPasswordValidator,
                            hintText: "Confirm Password",
                            prefixIcon: Icons.lock,
                            isPassword: true,
                          ),
                          SizedBox(
                            height: height10 * 2.8,
                          ),
                          //loginButton
                          state is RegisterLoadingState ==false?
                          CustomButton(
                            height: height10 * 5,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.register(context, email: cubit.email.text, name:cubit.name.text , phone:cubit.phone.text, password: cubit.password.text,isClient: widget.isClient);
                              }
                            },
                            buttonText: "SignUp",
                            margin: EdgeInsets.symmetric(
                                horizontal: height10 * 3.6),
                          ):CircularProgressIndicator(color: Colors.black,),
                          SizedBox(
                            height: height10 * 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an Account ?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 15, color: Colors.black),
                                ),
                                MaterialButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignInScreen(isClient: widget.isClient),));
                                  },
                                  child: Text(
                                    " Login",
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
            }));
  }
}
