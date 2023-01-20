import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/cubit/cubit.dart';
import 'package:mini_projet/layout/cubit/states.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_form_field.dart';

Widget sliderItem(int index, context,) {
  return Stack(
    children: [
      Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:AssetImage("assets/images/test1.png")),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: RichText(text: TextSpan(
              style: TextStyle(backgroundColor: Colors.white,color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "This\n"),
                TextSpan(text: "Season's\n"),
                TextSpan(text: "Latest"),

              ]
            )),
          )

        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 3,
                    color: Colors.black12),
              ],
              borderRadius: BorderRadius.circular(30),
              color: Colors.white),
          child: Padding(
              padding: EdgeInsets.all(10),
              child:Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Berkely",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w500),
                  ),

                ],
              )),
        ),
      )
    ],
  );
}

Widget gridItem(int index,context){
  double screenWidth=MediaQuery.of(context).size.width;
  return Stack(
    alignment: Alignment.topRight,
    children: [
      Container(
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Hero(
              tag: 'image$index',
                child: Image.asset("assets/images/test2.png",height: 110,width: screenWidth*0.3,fit: BoxFit.cover,)),
            SizedBox(height: 10,),
            Expanded(
              child: Column(
                children: [
                  Center(child: Text('Artsy',style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  SizedBox(height: 15,),
                  Text("SHOP NOW",maxLines: 1,),
                  SizedBox(height: 5,),
                  Container(height: 2,color: Colors.black,width:  screenWidth*0.33,),
                ],
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.favorite_border),
      )
    ],
  );
}

Widget newItem(context,LayoutCubit cubit){
  double width10 = MediaQuery.of(context).size.width / 41;
  double height10 = MediaQuery.of(context).size.height / 82;
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: width10 , vertical: height10 ),
    child: SingleChildScrollView(
      physics:BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<LayoutCubit,LayoutStates>(builder: (context, state) {
            return InkWell(
              borderRadius: BorderRadius.circular(width10*6),
              onTap: (){
                cubit.getItemImage();
              },
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: height10 * 12,
                width: width10 * 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: cubit.itemImage==null?AssetImage("assets/images/add-image.png") as ImageProvider:FileImage(cubit.itemImage!))),
              ),
            );
          }, listener: (context, state) {

          },),
          SizedBox(height: height10*0.5),
          Text(
            "Add image",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
                fontSize: height10 * 1.7,
                color: Colors.black26),
          ),
          SizedBox(height: height10 * 2),
          CustomFormField(hintText: "Product Name", prefixIcon: Icons.text_fields),
          SizedBox(
            height: height10*2.8 ,
          ),
          CustomFormField(hintText: "Product Price", prefixIcon: Icons.euro,),
          SizedBox(
            height: height10*2.8 ,
          ),
          CustomFormField(
              hintText: "Product Description", prefixIcon: Icons.description,),
          SizedBox(
            height: height10*2.8 ,
          ),
          CustomButton(
            transparent: true,
            margin: EdgeInsets.only(right: width10/2),
            width: width10*15,
            onPressed: () {
            },
            buttonText: "Post",
            fontSize: 30,
            height: height10 * 6,
          ),
          SizedBox(
            height: height10 * 23,
          ),

        ],
      ),
    ),
  );
}