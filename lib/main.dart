import 'package:flutter/material.dart';
import 'package:food_finder/Widgets/bottom_navigation.dart';
import 'package:food_finder/Pages/profile_page.dart';
import 'package:food_finder/data/profile.dart';
import 'package:food_finder/Pages/food_basket.dart';
import 'package:food_finder/Pages/food_search.dart';
import 'package:food_finder/Pages/qr_reader.dart';
import 'package:food_finder/Pages/settings.dart';
import 'package:food_finder/data/food_controller.dart';
import 'package:food_finder/data/meeting_rooms.dart';

void main() => runApp(MyApp());

const title = "Foodie";

// Main state of the application.
_HomePageState mainState;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(body1: TextStyle(color: Colors.black38), body2: TextStyle(color: Colors.white)),
        primarySwatch: Colors.blue,
        splashColor: Colors.red,
      ),
      home: HomePage(title: title, ),
      routes: <String, WidgetBuilder>{
        '/settings': (BuildContext context) => Settings(),
        '/qr_reader': (BuildContext context) => QrReader(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({GlobalKey key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() {
    mainState = _HomePageState();
    return mainState;
  }
}

class _HomePageState extends State<HomePage> {
  int page = 2;
  FoodController foodHandler = new FoodController();
  MeetingRoomController roomController = new MeetingRoomController();
  Profile profile = new Profile(name: "Jane", lastName: "Doe", joinedIn: DateTime.now(), budget: 100.0, age: 22);
  void updatePageIndex(int index){
    mainState.setState(() {
      page = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.settings), onPressed: (){
            Navigator.of(context).pushNamed('/settings');
          }),
        ],
        title: Text(widget.title, style: TextStyle(fontFamily: "Montserrat")),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: IndexedStack(
            index: mainState.page,
            children: <Widget>[
              FoodSearch(),
              FoodBasket(),
              ProfilePage(),
            ],
          ),
        ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
