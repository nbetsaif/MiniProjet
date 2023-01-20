import 'package:flutter/material.dart';
import 'package:mini_projet/modules/authentication/signup/signup_screen.dart';

import '../../shared/styles/colors.dart';
import '../../shared/widgets/custom_button.dart';
import '../authentication/signin/signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              height: height10 * 3,
            ),
            Image.asset(
              "assets/images/logo.png",
              width: width10 * 20,
              height: height10 * 20,
            ),
            SizedBox(
              height: height10,
            ),
            Text(
              "Bagzz",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height10 * 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width10 * 5),
              child: Text(
                "With our user-friendly interface, you can easily browse through thousands of products from your favorite brands",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17,
                      color: Colors.black26,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height10 * 10,
            ),
            CustomButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    context: context,
                    builder: (context) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width10 * 3, vertical: height10 * 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Make Selection!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: height10 * 3,
                                        color: Colors.black),
                              ),
                              SizedBox(height: height10),
                              Text(
                                "Select one of the options given bellow to login",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: height10 * 1.7,
                                        color: Colors.black26),
                              ),
                              SizedBox(height: height10 * 2),
                              InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(isClient: false),));

                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: height10 * 2,
                                      horizontal: width10 * 2),
                                  height: height10 * 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.greyColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.black,
                                        size: height10 * 5,
                                      ),
                                      SizedBox(
                                        width: width10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Trader",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: height10 * 1.7,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "Login as a trader",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: height10 * 1.7,
                                                      color: Colors.black),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: height10 * 2),
                              InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(isClient:true ),));

                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: height10 * 2,
                                      horizontal: width10 * 2),
                                  height: height10 * 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.greyColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.black,
                                        size: height10 * 5,
                                      ),
                                      SizedBox(
                                        width: width10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Client",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: height10 * 1.7,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                      Colors.black),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "Login as a client",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: height10 * 1.7,
                                                      color: Colors.black),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
              },
              buttonText: "Login",
              margin: EdgeInsets.symmetric(horizontal: width10 * 3.6),
              height: height10 * 5,
            ),
            SizedBox(
              height: height10 * 2.8,
            ),
            CustomButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      context: context,
                      builder: (context) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width10 * 3, vertical: height10 * 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Make Selection!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height10 * 3,
                                  color: Colors.black),
                            ),
                            SizedBox(height: height10),
                            Text(
                              "Select one of the options given bellow to Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontSize: height10 * 1.7,
                                  color: Colors.black26),
                            ),
                            SizedBox(height: height10 * 2),
                            InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(isClient: false),));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: height10 * 2,
                                    horizontal: width10 * 2),
                                height: height10 * 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.greyColor),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: height10 * 5,
                                    ),
                                    SizedBox(
                                      width: width10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Trader",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontSize: height10 * 1.7,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            "Sign Up as a trader",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.w300,
                                                fontSize: height10 * 1.7,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height10 * 2),
                            InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(isClient: true),));

                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: height10 * 2,
                                    horizontal: width10 * 2),
                                height: height10 * 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.greyColor),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: height10 * 5,
                                    ),
                                    SizedBox(
                                      width: width10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Client",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontSize: height10 * 1.7,
                                                fontWeight:
                                                FontWeight.bold,
                                                color:
                                                Colors.black),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            "Sign Up as a client",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.w300,
                                                fontSize: height10 * 1.7,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ));
                },
                buttonText: "Create an Account",
                margin: EdgeInsets.symmetric(horizontal: width10 * 3.6),
                transparent: true,
                height: height10 * 5),
            SizedBox(
              height: height10 * 2,
            ),
          ],
        ),
      ),
    );
  }
}
