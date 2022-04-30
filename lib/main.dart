import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoyo/screens/list_screen.dart';
import 'package:yoyo/screens/splash_screen.dart';
import 'package:yoyo/utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor:kwhite,
            statusBarIconBrightness: Brightness.dark
        )
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"YoYo",
      home: const SplashScreen(),
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id:(context)=> SplashScreen(),
        ListScreen.id:(context)=> ListScreen(),
      },
    );
  }
}


