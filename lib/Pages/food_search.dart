import 'package:flutter/material.dart';
import 'package:food_finder/main.dart';
import 'package:food_finder/styles/textstyles.dart';
import 'package:food_finder/Widgets/food_widget.dart';
class FoodSearch extends StatefulWidget {
  FoodSearch({Key key}) : super(key: key);
  @override
  _FoodSearchState createState(){
    dynamic _foodSearchState = _FoodSearchState();
    return _foodSearchState;
  }
}

class _FoodSearchState extends State<FoodSearch> {
  String decodedBarInfo = "";
  @override
  void initState() {
    super.initState();
  }
  // SnackBar for alerting the user that they have put a food in their baskets.
  SnackBar snackBar;
  void displaySnackBar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message, style: cardTextStyle),
      duration: Duration(milliseconds: 1500),
      backgroundColor: Colors.red,
      action: new SnackBarAction(label: "Dismiss", onPressed: () {
        Scaffold.of(context).hideCurrentSnackBar();
      }, textColor: Colors.white),
    ));
  }
  // Renders all the food on the menu.
  List<Widget> renderFoodItems() {
    List<Widget> list = [];
    mainState.foodHandler.menu.list.forEach((f) {
      list.add(FoodWidget(food: f));
    });
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: renderFoodItems(),
          ),
        ),
    );
  }
}