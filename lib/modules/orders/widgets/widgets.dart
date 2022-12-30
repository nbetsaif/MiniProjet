import 'package:flutter/material.dart';

Widget orderItem(context,int index){
  var screenWidth=MediaQuery.of(context).size.width;
  return SizedBox(
    height: 180,
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Hero(
                      tag: 'image$index',
                      child: Image.asset(
                        "assets/images/test2.png",
                        height: 80,
                        width: screenWidth * 0.22,
                      ))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                padding: EdgeInsets.all(5),
                color: Colors.green,
                child: Text(
                  "Confirmed",
                  style: TextStyle(color: Colors.white,fontSize: 17),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  'Artsy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Wallet with chain",
                  maxLines: 1,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Style #36252 0YK0G 1000",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(.4)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      '\$564',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: screenWidth*0.1,)
                  ],
                ),
                Spacer()
              ],
            )),
      ],
    ),
  );
}

Widget divider(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    height: 2,
    color: Colors.black,
  );
}