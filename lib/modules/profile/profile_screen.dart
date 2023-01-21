import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/cubit/cubit.dart';
import 'package:mini_projet/layout/cubit/states.dart';
import 'package:mini_projet/modules/welcome/welcome_screen.dart';

import '../../shared/styles/colors.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_form_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    return BlocConsumer<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //profile
              Column(
                children: [
                  SizedBox(
                    height: height10 * 3,
                  ),
                  //profile image
                  InkWell(
                    borderRadius: BorderRadius.circular(width10*7),
                    onTap: (){
                      if(cubit.editingProfile == true){
                        cubit.getProfileImage();
                      }
                    },
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: height10 * 14,
                      width: width10 * 14,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:cubit.profileImage==null?AssetImage("assets/images/defaultImage.jpg") as ImageProvider:FileImage(cubit.profileImage!)
                              // cubit.userModel.image == null ? AssetImage("assets/images/defaultImage.jpg") as ImageProvider
                              //     : NetworkImage(cubit.userModel.image!)

                          )),
                      child: cubit.editingProfile == true
                          ? Container(
                              padding: EdgeInsets.only(bottom: height10 * 0.7),
                              width: double.infinity,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    stops: [
                                      0.3,
                                      0.3
                                    ],
                                    colors: [
                                      Colors.black.withOpacity(0.3),
                                      Colors.grey.withOpacity(0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter),
                              ),
                              child: Icon(
                                size: height10 * 3,
                                Icons.camera_alt,
                                color: AppColors.greyColor.withOpacity(0.7),
                              ),
                            )
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: height10,
                  ),
                  //edit profile button
                  cubit.editingProfile == false
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.startEditProfile();
                              },
                              child: Container(
                                height: height10 * 4,
                                width: width10 * 12,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: width10 * 0.5,
                                    ),
                                    Text(
                                      "Edit Profile",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: height10 * 1.5,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height10 * 3,
                            ),
                            //greeting
                            Text(
                              "Hi there Saif!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: height10 * 2.2),
                            ),
                            SizedBox(
                              height: height10,
                            ),
                            //SignOut Button
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: height10 * 5,
                                width: width10 * 10,
                                child: Text(
                                  "Sign Out",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: height10 * 1.8,
                                          color: Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(height: height10),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: height10 * 1,
                            ),
                            Text(
                              "Edit Your Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: height10 * 2.2),
                            ),
                            SizedBox(
                              height: height10 * 2,
                            )
                          ],
                        ),
                ],
              ),
              //fields
              CustomFormField(
                hintText: "Name",
                prefixIcon: Icons.person,
                enabled: cubit.editingProfile!,
              ),
              SizedBox(
                height: height10 * 2.8,
              ),
              CustomFormField(
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  enabled: cubit.editingProfile!),
              SizedBox(
                height: height10 * 2.8,
              ),
              CustomFormField(
                  hintText: "Mobile No",
                  prefixIcon: Icons.phone_android,
                  enabled: cubit.editingProfile!),
              SizedBox(
                height: height10 * 2.8,
              ),

              cubit.editingProfile == true
                  ? Column(
                      children: [
                        CustomFormField(
                          hintText: "Password",
                          prefixIcon: Icons.lock,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: height10 * 2.8,
                        ),
                        CustomFormField(
                          hintText: "Confirm Password",
                          prefixIcon: Icons.lock,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: height10 * 2.8,
                        ),
                        CustomButton(
                          onPressed: () {
                            cubit.doneEditProfile();
                          },
                          buttonText: "Update",
                          margin: EdgeInsets.symmetric(horizontal: width10 * 8),
                          height: height10 * 5,
                        ),
                        SizedBox(
                          height: height10 * 2.8,
                        ),
                        CustomButton(
                          onPressed: () {
                            cubit.doneEditProfile();
                          },
                          buttonText: "Cancel",
                          margin: EdgeInsets.symmetric(horizontal: width10 * 8),
                          height: height10 * 5,
                          transparent: true,
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
