import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/cubit/states.dart';
import 'package:mini_projet/modules/home/widget/widgets.dart';
import 'package:mini_projet/shared/styles/colors.dart';
import '../../layout/cubit/cubit.dart';
import '../../shared/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        builder: (context, state) {
          return CustomScrollView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 230,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: CarouselSlider(
                      items: List.generate(
                          5, (index) => sliderItem(index, context)),
                      options: CarouselOptions(
                          scrollPhysics: BouncingScrollPhysics(),
                          height: 210,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              const Duration(seconds: 1, milliseconds: 500),
                          enableInfiniteScroll: false,
                          scrollDirection: Axis.horizontal,
                          autoPlayInterval: const Duration(seconds: 3),
                          initialPage: 0,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          viewportFraction: 0.85)),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:20,vertical: 20),
                  child: const Text("Products"),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,mainAxisExtent: 210),
                        itemBuilder: (context,index){
                        return gridItem(index,context);
                        },
                      itemCount: 6,
                    ),
                  )),
              SliverToBoxAdapter(
                  child:SizedBox(height: 20,)),
              SliverToBoxAdapter(
                  child: CustomButton(onPressed: (){},buttonText: "Check All Products",margin: EdgeInsets.symmetric(horizontal:60), transparent: true,height: 50,),),
            ],
          );
        },
        listener: (context, state) {});
  }
}
