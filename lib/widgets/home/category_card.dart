import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoyo/utilities/constants.dart';

import '../icon.dart';
import '../text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, this.name,this.image,this.color, this.textColor, this.backgroundIconColor,}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final name,image,color,textColor,backgroundIconColor;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 6,bottom: 6,right: 9),
      decoration: BoxDecoration(
        color: color,
        borderRadius: new BorderRadius.all(Radius.circular(40)),
      ),
      height: 60,
      width: 120,
      child:Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: backgroundIconColor,
            child: Image.asset(image,width: 35,height: 35,)
          ),
          TextWidget(text: name,color: textColor,bold: false,size: 16.0,shadow: false,),

        ],
      ),
    );
  }
}
