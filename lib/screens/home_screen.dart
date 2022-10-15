import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoyo/models/Food.dart';
import 'package:yoyo/models/FoodCategory.dart';
import 'package:yoyo/screens/info_screen.dart';
import 'package:yoyo/screens/list_screen.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/appbar.dart';
import 'package:yoyo/widgets/drawer/drawer.dart';
import 'package:yoyo/widgets/home/category_card.dart';
import 'package:yoyo/widgets/home/food_card.dart';
import 'package:yoyo/widgets/text.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id='home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late final PageController _movieCardPageController;
  late final PageController _movieDetailPageController;

  double _movieCardPage = 0.0;
  double _movieDetailsPage = 0.0;
  int _movieCardIndex = 0;
  final _showMovieDetails = ValueNotifier(true);



  var _selectedCategoryIndex=0,_foodList;
  var _categories=[FoodCategory.Burger.toShortString(),FoodCategory.Pizza.toShortString(),FoodCategory.Glace.toShortString()],
      _categoryImages=["burgerNoBg.png","pizzaNoBg.png","iceCreamNoBg.png"];

  @override
  void initState() {
    super.initState();
    foodList();

    _movieCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(_movieCardPagePercentListener);
    _movieDetailPageController = PageController()
      ..addListener(_movieDetailsPagePercentListener);
  }

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  _movieDetailsPagePercentListener() {
    setState(() {
      _movieDetailsPage = _movieDetailPageController.page!;
    });
  }

  @override
  void dispose() {
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();
    _movieDetailPageController
      ..removeListener(_movieDetailsPagePercentListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (_,constraints){
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: Homeappbar(title: "YoYo"),
            drawer: DrawerWidget(),
            backgroundColor: kwhite,
            body: Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (
                    OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20),
                          TextWidget(text: "Ce n'est pas ",color: kblack,bold: false,size: 20.0,shadow: false,),
                          TextWidget(text: "la fourchette",color: kblack,bold: true,size: 22.0,shadow: false,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextWidget(text: "qui fait le bon plat ",color: kblack,bold: false,size: 20.0,shadow: false,),
                      ),

                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextWidget(text: "Catégories",color: kblack,bold: true,size: 20.0,shadow: false,),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        child:  NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (
                              OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            return true;
                          },
                          child: ListView.builder(
                              itemCount: _categories.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return Row(
                                  children: [
                                    SizedBox(width: 20),
                                    GestureDetector(
                                      onTap: () =>
                                          setState(() {
                                            _selectedCategoryIndex = i;
                                          }),
                                      child: CategoryCard(
                                          name: _categories[i],
                                          image: "assets/categories/${_categoryImages[i]}",
                                          color: _selectedCategoryIndex == i ? kpink : klightgrey,
                                          textColor: _selectedCategoryIndex == i ? kwhite : kblack,
                                          backgroundIconColor: _selectedCategoryIndex == i ? kwhite : klightgrey),
                                    ),
                                    if(i==_categories.length-1)
                                      SizedBox(width: 20)
                                  ],
                                );
                              }
                          ),
                        ),
                      ),

                      SizedBox(height: 40),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          TextWidget(text: "Populaire",color: kblack,bold: true,size: 20.0,shadow: false,),
                          Spacer(),
                          InkWell(
                              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ListScreen(category: _categories[_selectedCategoryIndex]))),
                              child: TextWidget(text: "Voir tout",color: kpink,bold: false,size: 16.0,shadow: false,)),
                          SizedBox(width: 20,),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Container(
                      //   color: kwhite,
                      //   height: 280,
                      //   child:  NotificationListener<OverscrollIndicatorNotification>(
                      //     onNotification: (
                      //         OverscrollIndicatorNotification overscroll) {
                      //       overscroll.disallowGlow();
                      //       return true;
                      //     },
                      //     child: ListView.builder(
                      //         itemCount: _foodList.length,
                      //         scrollDirection: Axis.horizontal,
                      //         itemBuilder: (context, i) {
                      //         return Row(
                      //         children: [
                      //           if(_foodList[i].getCategory()==_categories[_selectedCategoryIndex])
                      //             SizedBox(width: 20),
                      //           if(_foodList[i].getCategory()==_categories[_selectedCategoryIndex])
                      //           FoodCard(width: MediaQuery.of(context).size.width/2.2,height: 200.0,food: _foodList[i],
                      //             function: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoScreen(food: _foodList[i])))),
                      //           if(i==_foodList.length-1)
                      //             SizedBox(width: 20)
                      //         ],
                      //       );
                      //     }
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: h * 0.6,
                        child: PageView.builder(
                          controller: _movieCardPageController,
                          clipBehavior: Clip.none,
                          itemCount: _foodList.length,
                          onPageChanged: (page) {
                            _movieDetailPageController.animateToPage(
                              page,
                              duration: const Duration(milliseconds: 500),
                              curve: const Interval(0.25, 1, curve: Curves.decelerate),
                            );
                          },
                          itemBuilder: (_, index) {
                            final movie = _foodList[index];
                            final progress = (_movieCardPage - index);
                            final scale = ui.lerpDouble(1, .8, progress.abs())!;
                            final isCurrentPage = index == _movieCardIndex;
                            final isScrolling = _movieCardPageController
                                .position.isScrollingNotifier.value;
                            final isFirstPage = index == 0;

                            return Transform.scale(
                              alignment: Alignment.lerp(
                                Alignment.topLeft,
                                Alignment.center,
                                -progress,
                              ),
                              scale: isScrolling && isFirstPage ? 1 - progress : scale,
                              child: GestureDetector(
                                onTap: () {
                                  _showMovieDetails.value = !_showMovieDetails.value;
                                  const transitionDuration = Duration(milliseconds: 550);
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration: transitionDuration,
                                      reverseTransitionDuration: transitionDuration,
                                      pageBuilder: (_, animation, ___) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: InfoScreen(food: _foodList[0]),
                                        );
                                      },
                                    ),
                                  );
                                  Future.delayed(transitionDuration, () {
                                    _showMovieDetails.value = !_showMovieDetails.value;
                                  });
                                },
                                child: Hero(
                                  tag: movie.getImage(),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    transform: Matrix4.identity()
                                      ..translate(
                                        isCurrentPage ? 0.0 : -20.0,
                                        isCurrentPage ? 0.0 : 60.0,
                                      ),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(70),
                                      ),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     blurRadius: 25,
                                      //     offset: const Offset(0, 25),
                                      //     color: Colors.black.withOpacity(.2),
                                      //   ),
                                      // ],
                                      image: DecorationImage(
                                        image: AssetImage("assets/${movie.getImage()}"),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  foodList()
  {
    _foodList=[Food("Burger","Mozarella","Mozarella, Mozarella, Mozarella",14,"burger.jpg","burger.jpg",FoodCategory.Burger.toShortString()),
      Food("Pizza","Mozarella","Mozarella, Mozarella, Mozarella",14.5,"pizza.jpg","pizza.jpg",FoodCategory.Pizza.toShortString())];

    // _foodList=[Food("Burger","Mozarella","Mozarella, Mozarella, Mozarella",14,"burgerNoBg.png","burger.jpg",FoodCategory.Burger.toShortString()),
    //   Food("Pizza","Mozarella","Mozarella, Mozarella, Mozarella",14.5,"pizzaNoBg.png","pizza.jpg",FoodCategory.Pizza.toShortString()),
    //   Food("Glace","Chocolat","Chocolat, Chocolat, Chocolat",15.5,"iceCreamNoBg.png","iceCream.jpg",FoodCategory.Glace.toShortString()),
    //   Food("Glace","Chocolat","Chocolat, Chocolat, Chocolat",15.5,"iceCreamNoBg.png","iceCream.jpg",FoodCategory.Glace.toShortString())];
  }
}
