import 'package:flutter/material.dart';
import 'package:food_finder/main.dart';

const navItemStyle = TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w100);

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void updatePageIndex(int index){
    mainState.setState(() {
      mainState.page = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.redAccent,
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow)),
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Food Search', style: navItemStyle),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Food Basket', style: navItemStyle),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile', style: navItemStyle),
          ),
        ],
        currentIndex: mainState.page,
        onTap: (index) => updatePageIndex(index),
      ),
    );
  }
}
