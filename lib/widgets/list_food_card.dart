// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoyo/screens/info_screen.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/text.dart';
import 'button.dart';

class ListFoodCard extends StatelessWidget {

  ListFoodCard({Key? key,this.food,this.height,this.width}) : super(key: key);
  final food,height,width;

  @override
  Widget build(BuildContext context) {
    return Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15,top: 15),
            decoration: new BoxDecoration(color: kwhite, borderRadius: new BorderRadius.all(Radius.circular(40)),
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text:food.getName(),color: kblack,bold: true,size: 18.0,shadow: false,),
                      TextWidget(text:food.getShortDescription(),color: kgrey,bold: false,size: 16.0,shadow: false,),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    SizedBox(width: 10),
                    TextWidget(text:"${food.getPrice()} DT",color: kblack,bold: true,size: 18.0,shadow: false,),
                    Spacer(),
                    ButtonWidget(text: "Détails",function: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoScreen(food: food))))
                  ],
                )
              ],
            ),
          ),
          Positioned(
            left: 5,
            bottom: 70,//TRY TO CHANGE THIS **0.30** value to achieve your goal
            child: Image.asset('assets/categories/${food.getImage()}',width: 140,height: 140),
          ),
        ]
    );
  }
}
