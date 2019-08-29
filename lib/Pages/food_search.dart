import 'package:flutter/material.dart';
import 'package:food_finder/main.dart';
import 'package:food_finder/styles/textstyles.dart';
import 'package:food_finder/data/barcode_data.dart';
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
      var controller = mainState.foodHandler;
      list.add(SizedBox(
        width: (MediaQuery.of(context).size.width),
        child: Card(
          borderOnForeground: true,
          elevation: 5.0,
          child: Column(
            children: <Widget>[
              Text("${f.name}", style: cardTextStyle.copyWith(color: Colors.black, fontSize: 24.0)),
              Divider(height: 10.0, color: Colors.black38,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Price: ${f.price} TL", style: cardTextStyle.copyWith(color: Colors.green, fontSize: 18.0)),
                  Text("x${f.count} left.", style: cardTextStyle.copyWith(fontSize: 18.0),),
                ],
              ),
              Divider(height: 10.0, color: Colors.black38,),
              Image.asset(
                'lib/images/${f.name.toLowerCase()}.jpg',
                semanticLabel: "Food picture.",
                width: 300.0,
                height: 300.0,
                fit: BoxFit.cover
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(indent: 10.0,),
                  Expanded(flex: 1,
                    child: FlatButton.icon(
                        icon: Icon(Icons.chrome_reader_mode),
                        label: Text("Read QR"),
                        color: Colors.redAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          print(f.name.toLowerCase());
                          getBarcodeData().then((value) {
                            if (value == f.name.toLowerCase()) {
                              mainState.setState(() {
                                controller.addToBasket(f);
                              });
                              mainState.updatePageIndex(1);
                              displaySnackBar(
                                  "You have added a ${f.name} to the basket!");
                            } else {
                              displaySnackBar(
                                  "This barcode is invalid for this app.");
                            }
                          });
                        }),
                  ),
                  Divider(indent: 10.0,),
                  Expanded(flex: 1, child: FlatButton.icon(
                    icon: Icon(Icons.add_circle),
                    label: Text("Add"),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      mainState.setState(() {
                        mainState.foodHandler.addToBasket(f);
                      });
                      displaySnackBar("You have added a ${f.name} to the basket!");
                    },
                  ),
                  ),
                  Divider(indent: 10.0,),
                ],
              )
            ],
          ),
        ),
      ));
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