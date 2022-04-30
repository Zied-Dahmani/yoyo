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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id='home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _selectedCategoryIndex=0,_foodList;

  var _categories=[FoodCategory.Burger.toShortString(),FoodCategory.Pizza.toShortString(),FoodCategory.Glace.toShortString()],
      _categoryImages=["burgerNoBg.png","pizzaNoBg.png","iceCreamNoBg.png"];

  @override
  void initState() {
    super.initState();
    foodList();
  }

  @override
  Widget build(BuildContext context) {
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
                      Container(
                        color: kwhite,
                        height: 280,
                        child:  NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (
                              OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            return true;
                          },
                          child: ListView.builder(
                              itemCount: _foodList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                              return Row(
                              children: [
                                if(_foodList[i].getCategory()==_categories[_selectedCategoryIndex])
                                  SizedBox(width: 20),
                                if(_foodList[i].getCategory()==_categories[_selectedCategoryIndex])
                                FoodCard(width: MediaQuery.of(context).size.width/2.2,height: 200.0,food: _foodList[i],
                                  function: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoScreen(food: _foodList[i])))),
                                if(i==_foodList.length-1)
                                  SizedBox(width: 20)
                              ],
                            );
                          }
                          ),
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

  foodList()
  {
    _foodList=[Food("Burger","Mozarella","Mozarella, Mozarella, Mozarella",14,"burgerNoBg.png","burger.jpg",FoodCategory.Burger.toShortString()),
      Food("Pizza","Mozarella","Mozarella, Mozarella, Mozarella",14.5,"pizzaNoBg.png","pizza.jpg",FoodCategory.Pizza.toShortString()),
      Food("Glace","Chocolat","Chocolat, Chocolat, Chocolat",15.5,"iceCreamNoBg.png","iceCream.jpg",FoodCategory.Glace.toShortString()),
      Food("Glace","Chocolat","Chocolat, Chocolat, Chocolat",15.5,"iceCreamNoBg.png","iceCream.jpg",FoodCategory.Glace.toShortString())];
  }
}
