import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

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