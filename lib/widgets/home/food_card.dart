// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoyo/screens/info_screen.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/text.dart';

class FoodCard extends StatelessWidget {

  FoodCard({Key? key,this.food,this.height,this.width, this.function}) : super(key: key);
  final food,height,width,function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>function(),
      child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: new BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                  BoxShadow(
                    color: kgrey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: height,
              width: width,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  TextWidget(text:food.getName(),color: kblack,bold: true,size: 18.0,shadow: false,),
                  TextWidget(text:food.getShortDescription(),color: kgrey,bold: false,size: 16.0,shadow: false,),
                  SizedBox(height: 10),
                  TextWidget(text:"${food.getPrice()} DT",color: kblack,bold: true,size: 18.0,shadow: false,),
                ],
              ),
            ),
            Positioned(
              bottom: 110,left: 12,//TRY TO CHANGE THIS **0.30** value to achieve your goal
              child: Image.asset("assets/categories/${food.getImage()}",width: 140,height: 140),
            ),
          ]
      ),
    );
  }
}
