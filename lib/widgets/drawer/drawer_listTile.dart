import 'package:flutter/cupertino.dart';
import 'package:yoyo/widgets/text.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({Key? key,this.icon,this.color,this.title,this.text,this.function}) : super(key: key);

  final icon,color,title,text,function;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 26.0,color: color,),
            SizedBox(width: 5,),
            TextWidget(text: title,color: color,bold: false,size: 16.0,shadow: false,),
          ],
        ),
        SizedBox(height: 10,),
        GestureDetector(
            onTap: (){
              if(function!=null)
                function();
            },
            child: TextWidget(text: text,color: color,bold: false,size: 14.0,shadow: false,)),
      ],
    );
  }
}


