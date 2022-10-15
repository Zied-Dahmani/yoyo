import 'package:flutter/material.dart';
import 'package:yoyo/animations/custom_animated_opacity.dart';
import 'package:yoyo/animations/screen_animation_controller.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/icon.dart';
import 'package:yoyo/widgets/text.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key,}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  late final ScreenAnimationController _controller;

  var _switcherKey = 0;

  @override
  void initState() {
    super.initState();
    _controller = ScreenAnimationController(
      buttonController: AnimationController(
        duration: const Duration(milliseconds: 750),
        vsync: this,
      ),
      contentController: AnimationController(
        duration: const Duration(milliseconds: 750),
        vsync: this,
      ),
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await _controller.buttonController.forward();
      await _controller.buttonController.reverse();
      await _controller.contentController.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxWidth;
      final h = constraints.maxHeight;

      return Scaffold(
        backgroundColor: kwhite,
        //extendBodyBehindAppBar: true,
        // appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight),
        //   child: CustomAnimatedOpacity(
        //     animation: _controller.topOpacityAnimation,
        //     child: AppBar(backgroundColor: kwhite,foregroundColor: kblack,elevation: 0)
        //   ),
        // ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              width: w,
              height: h-20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                child: Column(
                  children: [

                    CustomAnimatedOpacity(
                      animation: _controller.topOpacityAnimation,
                      child: Container(
                          padding: EdgeInsets.only(right: 15,left: 15,bottom: 20),
                          decoration: new BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage("assets/pizza.jpg")
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
                                  TextWidget(text: "Pizza",color: kwhite,bold: true,size: 24.0,shadow: true,),
                                  Row(
                                    children: [
                                      Icon(Icons.monetization_on_rounded, color: kwhite, size: 20.0,),
                                      SizedBox(width: 5),
                                      AnimatedSwitcher(
                                          duration: Duration(milliseconds: 800),
                                          child: TextWidget(key:Key('$_switcherKey'),text: "${_switcherKey+16} DT",color: kwhite,bold: true,size: 18.0,shadow: true,)),
                                    ],
                                  ),
                                ],
                              ))
                      ),
                    ),

                    CustomAnimatedOpacity(
                      animation: _controller.topOpacityAnimation,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextWidget(text: "Description", color: kblack,bold: true,size: 18.0,shadow: false),
                                Spacer(),
                                Icon(Icons.star,color: kpink,size: 20),
                                TextWidget(text: "4.6",color: kblack,bold: false,size: 18.0,shadow: false),
                              ],
                            ),
                            SizedBox(height: 4),
                            TextWidget(text:"lorem", color: kgrey,bold: false,size: 16.0,shadow: false),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: () {

                  setState(() {
                    _switcherKey++;
                  });
                  // const transitionDuration = Duration(milliseconds: 400);
                  //
                  // Navigator.of(context).push(
                  //   PageRouteBuilder(
                  //     transitionDuration: transitionDuration,
                  //     reverseTransitionDuration: transitionDuration,
                  //     pageBuilder: (_, animation, ___) {
                  //       return FadeTransition(
                  //         opacity: animation,
                  //         child:  InfoScreen(food: Food("Burger","Mozarella","Mozarella, Mozarella, Mozarella",14,"burgerNoBg.png","burger.jpg",FoodCategory.Burger.toShortString())),
                  //       );
                  //     },
                  //   ),
                  // );

                },
                child: AnimatedBuilder(
                  animation: _controller.buttonController,
                  builder: (_, child) {
                    final size = _controller.buttonSizeAnimation(
                      Size(w * .7, h * .07),
                      Size(w * 1.2, h * 1.1),
                    ).value;
                    final margin = _controller.buttonMarginAnimation(h * .03).value;

                    return Container(
                      width: size.width,
                      height: size.height,
                      margin: EdgeInsets.only(bottom: margin),
                      decoration:  BoxDecoration(
                        color: kpink,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    );
                  }, 
                ),
              ),
            ),

            Positioned(
              bottom: h * .055,
              child:  IgnorePointer(
                child: TextWidget(text: "Suivant",color: kwhite,bold: true,size: 16.0,shadow: false),
              ),
            ),
          ],
        ),
      );

    });
  }


}