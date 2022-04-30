import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer_listTile.dart';
import '../icon.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url,forceSafariVC:false,forceWebView: false);
    } else throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kwhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 60,left: 20,bottom: 20),
              color: kwhite,
              child: CircleAvatar(
                  radius: 60,
                  backgroundColor: kwhite,
                  backgroundImage:AssetImage('assets/yoyo.jpg')
              ),
            ),
            Divider(color: klightgrey,thickness: 2),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: kwhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerListTile(icon:Icons.timelapse_outlined,color: kdarkgrey,title:"Horaire",
                    text:"- Lundi au vendredi 9h00 à 17h00\n- Samedi 9h00 à 14h00",),

                  DrawerListTile(icon:Icons.location_on,color: kdarkgrey,title:"Nos points de vente",
                    text:"- Menzah 5 \n- Menzah 6\n- Sousse",function: ()=>_launchURL('https://bit.ly/3fRFWNy'),),

                  DrawerListTile(icon:Icons.phone,color: kdarkgrey,title:"Contact",
                      text:"- 21 111 222\n- 71 555 666",function:()=>launch("tel://+216$kphoneNumber")),
                ],
              ),
            ),

            Spacer(),
            Divider(color: klightgrey,thickness: 2,),
            Container(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              color: kwhite,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconWidget(icon:Icons.email_rounded,color:kblack,backgroundColor:klightgrey ,function: ()=>launch('mailto:habibbouzgarrou13@gmail.com?subject= &body= ')),
                      SizedBox(width: 5,),
                      IconWidget(icon:Icons.facebook,color:kblack,backgroundColor:klightgrey ,function: ()=>_launchURL('https://www.facebook.com/yoyochocoland')),
                      SizedBox(width: 5,),
                      IconWidget(icon:FontAwesomeIcons.instagram,color:kblack,backgroundColor:klightgrey ,function: ()=>_launchURL('https://www.instagram.com/yo_yo_food/?hl=fr')),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(child: GestureDetector(
                      onTap: ()=>_launchURL('https://play.google.com/store/apps/developer?id=Rebound+Dev'),
                      child: TextWidget(text: '@Rebound Dev',color: kblack,bold: false,size: 16.0,shadow: false,))),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


