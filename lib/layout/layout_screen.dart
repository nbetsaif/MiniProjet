import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_projet/layout/cubit/cubit.dart';
import 'package:mini_projet/layout/cubit/states.dart';

class LayoutScreen extends StatefulWidget {
  final bool isClient;
  const LayoutScreen({required this.isClient,Key? key}) : super(key: key);

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
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        cubit.isClient=widget.isClient;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Icon(
              Icons.menu_outlined,
              color: Colors.black,
            ),
            title: Text(
             widget.isClient==true? cubit.appBarTitles[cubit.currentIndex]:cubit.appBarTraderTitles[cubit.currentIndex],
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(
                  widget.isClient==true?
                  cubit.listOfIcons[cubit.currentIndex]:cubit.listOfTraderIcons[cubit.currentIndex],
                  color: Colors.black,
                  size: 25,
                ),
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
                itemCount:widget.isClient==true? cubit.bodyScreens.length:cubit.bodyTraderScreens.length,
                itemBuilder: (context, index) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      widget.isClient==true? cubit.bodyScreens[cubit.currentIndex]:cubit.bodyTraderScreens[cubit.currentIndex],
                      SizedBox(
                        height: 100,
                      )
                    ],
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
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
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.isClient==true?4:3,
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
                                  width:widget.isClient==true? screenWidth * .21:screenWidth*.29,
                                  alignment: Alignment.center,
                                  child: FaIcon(
                                    widget.isClient==true? cubit.listOfIcons[index]:cubit.listOfTraderIcons[index],
                                    size: cubit.currentIndex == index ? 35 : 25,
                                    color: index == cubit.currentIndex
                                        ? Colors.black
                                        : Colors.black26,
                                  )))),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
