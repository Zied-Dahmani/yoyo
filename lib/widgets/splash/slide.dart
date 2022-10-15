import 'package:flutter/material.dart';
import 'package:yoyo/screens/home_screen.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/splash/progress_button.dart';
import 'package:yoyo/widgets/text.dart';


class Slide extends StatelessWidget {

  Slide({Key? key, this.image, this.title, this.description, this.progressValue, this.function}) : super(key: key);
  final image,title,description,progressValue,function;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: Column(
        children: [
          Image.asset(image,height: MediaQuery.of(context).size.height/2.1, fit:BoxFit.fitHeight),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            color: kwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(text:"C'est bon, vous",color: kblack,bold: true,size: 22.0,shadow: false,),
                Container(
                  padding: EdgeInsets.only(bottom: 15.0),
                  width: 165,
                  child: Row(
                    children: [
                      TextWidget(text:" êtes chez ",color: kblack,bold: true,size: 22.0,shadow: false,),
                      TextWidget(text:"Yoyo!",color: kpink,bold: true,size: 22.0,shadow: false,),
                    ],
                  ),
                ),
                TextWidget(text:"lorem lorem lorem lorem lorem\nlorem lorem lorem lorem lorem", color: kgrey,bold: false,size: 18.0,shadow: false,),

                SizedBox(height: 25),
                ProgressButton(function: function,progressValue:progressValue),

                SizedBox(height: 10),
                GestureDetector(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen())),
                    child: TextWidget(text:"Passer", color: kpink,bold: false,size: 14.0,shadow: false)),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
