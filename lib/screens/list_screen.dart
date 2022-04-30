import 'package:flutter/material.dart';
import 'package:yoyo/models/Food.dart';
import 'package:yoyo/models/FoodCategory.dart';
import 'package:yoyo/utilities/constants.dart';
import 'package:yoyo/widgets/list_food_card.dart';

class ListScreen extends StatefulWidget {

  static String id='list_screen';

  const ListScreen({Key? key, this.category}) : super(key: key);
  final category;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  var _foodList=[];

  @override
  void initState() {
    super.initState();
    foodList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(backgroundColor: kwhite,elevation: 0,foregroundColor: kblack),
      body: Container(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (
              OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView.builder(
              itemCount: _foodList.length,
              itemBuilder: (context, i) {
                return   Column(
                  children: [
                    if(_foodList[i].getCategory()==widget.category)
                      SizedBox(height: 60),
                    if(_foodList[i].getCategory()==widget.category)
                      ListFoodCard(width: MediaQuery.of(context).size.width-40,height: 160.0,food: _foodList[i]),
                    if(i==_foodList.length-1)
                      SizedBox(height: 40),
                  ],
                );
              }
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
