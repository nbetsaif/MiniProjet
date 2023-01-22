import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_projet/layout/cubit/cubit.dart';
import 'package:mini_projet/layout/cubit/states.dart';
import 'package:mini_projet/shared/widgets/custom_button.dart';
import 'package:mini_projet/shared/widgets/expandable_text_widget.dart';

class ProductScreen extends StatelessWidget {
  int index;
   ProductScreen({Key? key,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height10=MediaQuery.of(context).size.height/81;
    double screenWidth=MediaQuery.of(context).size.width;
    double width10 =screenWidth/41;
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context, state) {},
      builder: ((context, state) {
        LayoutCubit cubit=LayoutCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),onPressed: (){Navigator.pop(context);}),
            ),
            body:SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start  ,
                  children: [
                    SizedBox(
                      height: 180,
                      child: Row(
                        children: [
                          Expanded(child: Hero(tag: 'image$index',child: Image.asset("assets/images/test2.png",height: 160,width:double.infinity,fit: BoxFit.cover,)),),
                          SizedBox(width: 10,),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              SizedBox(
                                  width: screenWidth*0.3,
                                  child: Center(child: Text(cubit.items[index].name,style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,))),
                              SizedBox(height: 10,),
                              Text("Wallet with chain",maxLines: 1,style: TextStyle(fontSize: 14),),
                              SizedBox(height: 10,),
                              Text("Style #36252 0YK0G 1000",maxLines: 1,style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(.4)),),
                              SizedBox(height: 10,),
                              Text('\$${cubit.items[index].price}',style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 10,),
                              cubit.isClient==true? CustomButton(buttonText: 'BUY NOW ',onPressed: (){},width: screenWidth*0.3,center: true,):Container()

                            ],)),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Description',style: TextStyle(fontWeight: FontWeight.bold),),
                        cubit.isClient==true?InkWell(
                          onTap: (){},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.favorite_border),
                          ),
                        ):CustomButton(
                          margin: EdgeInsets.only(right: width10/2),
                          filledColor: Colors.red,
                          width: width10*16,
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "This is Center Short Toast",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          },
                          buttonText: "Delete Product",
                          height: height10 * 5,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    ExpandableTextWidget(text: cubit.items[index].description),
                    SizedBox(height: 30,),
                    Text('Material & care',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    ExpandableTextWidget(text: cubit.items[index].material),
                    SizedBox(height: 10,),
                    cubit.isClient==true?CustomButton(onPressed: (){
                      Navigator.pop(context);
                      LayoutCubit.get(context).changeScreen(2);
                    },buttonText: "Check All Orders",margin: EdgeInsets.symmetric(horizontal:60), transparent: true,height: 50,):Container(),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            )
        );
      }
      ),);
  }
}
