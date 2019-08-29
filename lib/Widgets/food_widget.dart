import 'package:food_finder/main.dart';
import 'package:flutter/material.dart';
import 'package:food_finder/data/food.dart';
import 'package:food_finder/data/barcode_data.dart';
import 'package:food_finder/styles/textstyles.dart';
class FoodWidget extends StatefulWidget {
  final Food food;
  const FoodWidget({
    Key key, this.food,
  }): super(key: key);
  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  void displaySnackBar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message, style: cardTextStyle),
      duration: Duration(milliseconds: 1500),
      backgroundColor: Colors.red,
      action: new SnackBarAction(label: "Dismiss", onPressed: () {
        Scaffold.of(context).hideCurrentSnackBar();
      }, textColor: Colors.white),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width),
      child: Card(
        borderOnForeground: true,
        elevation: 5.0,
        child: Column(
          children: <Widget>[
            Text("${widget.food.name}", style: cardTextStyle.copyWith(color: Colors.black, fontSize: 24.0)),
            Divider(height: 10.0, color: Colors.black38,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Price: ${widget.food.price} TL", style: cardTextStyle.copyWith(color: Colors.green, fontSize: 18.0)),
                Text("x${widget.food.count} left.", style: cardTextStyle.copyWith(fontSize: 18.0),),
              ],
            ),
            Divider(height: 10.0, color: Colors.black38,),
            Image.asset(
                'lib/images/${widget.food.name.toLowerCase()}.jpg',
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
                        getBarcodeData().then((value) {
                          if (value == widget.food.name.toLowerCase()) {
                            mainState.setState(() {
                              mainState.foodHandler.addToBasket(widget.food);
                            });
                            mainState.updatePageIndex(1);
                            displaySnackBar(
                                "You have added a ${widget.food.name} to the basket!");
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
                      mainState.foodHandler.addToBasket(widget.food);
                    });
                    displaySnackBar("You have added a ${widget.food.name} to the basket!");
                  },
                ),
                ),
                Divider(indent: 10.0,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
