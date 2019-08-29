import 'package:flutter/material.dart';
import 'package:food_finder/main.dart';
import 'package:food_finder/data/barcode_data.dart';
import 'package:food_finder/styles/textstyles.dart';
class FoodBasket extends StatefulWidget {
  FoodBasket({Key key}) : super(key: key);
  @override
  _FoodBasketState createState() => _FoodBasketState();
}

class _FoodBasketState extends State<FoodBasket> {
  final locationController = TextEditingController();
  double totalPrice = 0.0;
  String location;
  double getTotalPrice() {
    this.totalPrice = 0.0;
    mainState.foodHandler.basket.list.forEach((food) {
      totalPrice += food.price * food.count;
    });
    return this.totalPrice;
  }
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
  void initState() {
    super.initState();
  }
  List<Widget> renderFood() {
    List<Widget> foodWidgets = new List<Widget>();
    foodWidgets.add(Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Meeting Room:", style: cardTextStyle.copyWith(fontSize: 16.0),),
                Expanded(flex: 1,
                  child: TextField(controller: locationController,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    style: cardTextStyle,
                    readOnly: true,
                    decoration: InputDecoration(focusColor: Colors.redAccent, hoverColor: Colors.red, focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2.0,)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 2.0),
            FlatButton.icon(
              icon: Icon(Icons.chrome_reader_mode),
              color: Colors.redAccent,
              textColor: Colors.white,
              label: Text("Scan Barcode"),
              onPressed: () {
                mainState.roomController.meetingRoomList.forEach((room) {
                  print(room["name"]);
                });
                getBarcodeData().then((value) {
                  mainState.roomController.meetingRoomList.forEach((room) {
                    print(room["name"]);
                    if(value == room["name"]) {
                      setState(() {
                        location = value;
                        locationController.text = value;
                        displaySnackBar("Your meeting room is successfully saved!");
                      });
                    }
                  });
                });
              },
            ),
          ],
        ),
      ),
    ));
    foodWidgets.add(
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 100.0,
          child: Text("Total price is: ${getTotalPrice()}", style: cardTextStyle.copyWith(fontSize: 24.0),),
        ),
    );
    if(mainState.foodHandler.basket.list.length > 0) {
      mainState.foodHandler.basket.list.forEach((f) {
        foodWidgets.add(Card(
          elevation: 3.0,
          child: ListTile(
            leading: Image.asset('lib/images/${f.name.toLowerCase()}.jpg', fit: BoxFit.fill, height: double.infinity,),
            title: Text('${f.name} x${f.count}', style: cardTextStyle),
            trailing: FlatButton.icon(
                color: Colors.redAccent,
                textColor: Colors.white,
                label: Text("Remove", style: cardTextStyle.copyWith(fontWeight: FontWeight.bold)),
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                  print("Debug 1");
                  var controller = mainState.foodHandler;
                  mainState.setState(() {
                    controller.removeFromBasket(f);
                  });
                  displaySnackBar("You have removed ${f.name} from the basket.");
                }),
          ),
        ),);
      });
    }
    foodWidgets.add(
        FlatButton.icon(
          label: Text("Order All"),
          icon: Icon(Icons.attach_money),
          color: Colors.redAccent,
          textColor: Colors.white,
          onPressed: () {
            if(mainState.profile.budget < this.getTotalPrice()) {
              displaySnackBar("You don't have enough money for the order.");
            }
            else if(this.getTotalPrice() == 0.0) {
              displaySnackBar("There is no food in the basket yet.");
            }
            else if(this.location == null) {
              displaySnackBar("Please read the barcode for your meeting room.");
            }
            else {
              displaySnackBar("Your order for ${this.location} is on its way!");
              print("You have ordered the basket for ${getTotalPrice()} TL.");
              mainState.setState(() {
                mainState.profile.budget -= getTotalPrice();
                mainState.foodHandler.confirmOrder(getTotalPrice());
              });
            }
          }));
        return foodWidgets;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: renderFood(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}