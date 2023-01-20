import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/cubit/states.dart';
import 'package:mini_projet/modules/home/widget/widgets.dart';
import 'package:mini_projet/modules/product/prodct_detail_screen.dart';
import '../../layout/cubit/cubit.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    return BlocConsumer<LayoutCubit, LayoutStates>(
        builder: (context, state) {
          return CustomScrollView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            slivers: [
              if (LayoutCubit.get(context).isClient==false)SliverToBoxAdapter(
                child:Column(
                  children: [
                    CustomButton(
                      margin: EdgeInsets.only(right: width10/2),
                      filledColor: Colors.green,
                      width: width10*8,
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            context: context,
                            builder: (context) => newItem(context,LayoutCubit.get(context)));
                      },
                      buttonText: "+",
                      fontSize: 40,
                      height: height10 * 8,
                    ),
                    SizedBox(height: height10*2,),
                    Text('Add New Product'),
                    SizedBox(height: height10*2,),
                  ],
                ),
              ) ,
              if (LayoutCubit.get(context).isClient==true) SliverToBoxAdapter(
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
                        return InkWell(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(index: index,)));},
                            child: gridItem(index,context));
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
