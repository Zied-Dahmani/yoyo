import 'package:flutter/material.dart';
import 'package:yoyo/widgets/splash/slide.dart';
import 'home_screen.dart';
import 'package:audioplayers/audio_cache.dart';

class SplashScreen extends StatefulWidget {

  static String id='splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late PageController _pageController;
  final player = AudioCache();

  void nextPage(progressValue) {
    progressValue!=100 ?_pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInQuad)
    : Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    player.play('splash_screen_sound.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (
          OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: PageView(
          controller: _pageController,
          children: [
              Slide(image:"assets/onBoarding2.gif", title: "Title",description: "description",progressValue: 0,function: ()=> nextPage(0)),
              Slide(image:"assets/onBoarding3.gif", title: "Title",description: "description",progressValue: 50,function: ()=> nextPage(50)),
              Slide(image:"assets/onBoarding2.gif", title: "Title",description: "description",progressValue: 100,function: ()=> nextPage(100)),
          ]
      ),
    );
  }
}




