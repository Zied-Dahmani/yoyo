import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/button.dart';
import 'package:yoyo/widgets/icon.dart';
import 'package:yoyo/widgets/text.dart';

class InfoScreen extends StatelessWidget {

  static String id='info_screen';
  const InfoScreen({Key? key,this.food}) : super(key: key);

  final food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
                padding: EdgeInsets.only(right: 15,left: 15,bottom: 20),
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/${food.getImageInfo()}")
                    ) ,
                    borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0))
                ),
                height: MediaQuery.of(context).size.height/2.3,
                child:Center(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        IconWidget(icon:Icons.arrow_back,color:kwhite,backgroundColor: Colors.grey.withOpacity(0.50),function: ()=> Navigator.pop(context)),
                        Spacer(),
                        TextWidget(text: food.getName(),color: kwhite,bold: true,size: 24.0,shadow: true,),
                        Row(
                          children: [
                            Icon(Icons.monetization_on_rounded, color: kwhite, size: 20.0,),
                            SizedBox(width: 5),
                            TextWidget(text: "${food.getPrice()} DT",color: kwhite,bold: true,size: 18.0,shadow: true,),
                          ],
                        ),
                      ],
                    ))
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextWidget(text: "Description", color: kblack,bold: true,size: 18.0,shadow: false),
                      Spacer(),
                      Icon(Icons.star,color: kpink,size: 20),
                      TextWidget(text: "4.8",color: kblack,bold: false,size: 18.0,shadow: false),
                    ],
                  ),
                  SizedBox(height: 4),
                  TextWidget(text:food.getDescription(), color: kgrey,bold: false,size: 16.0,shadow: false),
                ],
              ),
            ),

          ],
        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kpink,
        icon: Icon(Icons.phone),
        label:  TextWidget(text: "Appeler",color: kwhite,bold: false,size: 16.0,shadow: false,),
        onPressed: () => launch("tel://+216$kphoneNumber"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
