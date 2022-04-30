import 'package:flutter/material.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/splash/indicator.dart';

class ProgressButton extends StatelessWidget {

  const ProgressButton({Key? key, this.function, this.progressValue}) : super(key: key);
  final function,progressValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: Stack(
        children: [
          Indicator(duration:const Duration(seconds: 10),size:75.0,function:function,progressValue:progressValue),
          Center(
            child: GestureDetector(
              onTap: ()=> function(),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(color: kpink,borderRadius: BorderRadius.circular(99)),
                child: Center(
                  child: Icon(Icons.arrow_forward,color: kwhite,size: 24),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
