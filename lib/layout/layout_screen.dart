import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_projet/layout/cubit/cubit.dart';
import 'package:mini_projet/layout/cubit/states.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
              title: Text(
                cubit.appBarTitles[cubit.currentIndex],
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              actions: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                )
              ],
            ),
            body: Stack(
              children: [
                PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    cubit.changeScreen(index);
                  },
                  itemCount: cubit.bodyScreens.length,
                  itemBuilder: (context, index) {
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        cubit.bodyScreens[cubit.currentIndex],
                        SizedBox(height: 100,)
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20,right: 10,left: 10),
                        alignment: Alignment.center,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 40,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30
                          ),
                        ),
                        child:ListView.builder(
                          shrinkWrap: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * .047,
                            ),
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  cubit.changeScreen(index);
                                  pageController.animateToPage(index,
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                    width: screenWidth * .21,
                                    alignment: Alignment.center,
                                    child: FaIcon(
                                      cubit.listOfIcons[index],
                                      size:cubit.currentIndex==index?  35:25,
                                      color: index == cubit.currentIndex
                                          ? Colors.black
                                          : Colors.black26,
                                    )))) ,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
