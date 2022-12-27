
import 'package:flutter/material.dart';



class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final double height;
     const ExpandableTextWidget({Key? key, required this.text ,this.height=0}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;
  late double textHeight= widget.height ==0?200 :widget.height;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHeight){
        firstHalf=widget.text.substring(0,textHeight.toInt());
        secondHalf=widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else {
      firstHalf=widget.text;
      secondHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?Text(firstHalf,style: TextStyle(fontSize:15,height: 1.5,color: Colors.black),) :Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hiddenText? firstHalf+"..." : firstHalf+secondHalf,style: TextStyle(fontSize:14,height: 2,color: Colors.black.withOpacity(.3)), ),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText= !hiddenText;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text( hiddenText? "Show more":"Show less",style: TextStyle(fontSize: 15,height: 2,color: Colors.black),),
                Icon(hiddenText? Icons.arrow_drop_down:Icons.arrow_drop_up ,color:Colors.black)
              ],
            ),
          )
        ],
      )
    );
  }
}
