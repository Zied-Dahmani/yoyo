import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/text.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, this.text, this.function, this.width}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final text,function,width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: kbuttonHeight,
          width: width,
          child: RaisedButton(
            child: TextWidget(text: text,color: kwhite,bold: true,size: 16.0,shadow: false),
            color: kpink,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(30.0),bottomRight:Radius.circular(30.0))),
            onPressed: ()=>function(),
          ),
        );
  }
}
