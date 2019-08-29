import 'package:flutter/material.dart';
import 'package:food_finder/main.dart';
import 'package:intl/intl.dart';
import 'package:food_finder/styles/textstyles.dart';
class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryTextTheme: TextTheme(
            body1: TextStyle(
              color: Colors.black38,
            ),
          ),
        splashColor: Colors.red,
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Card(
            elevation: 3.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Image.asset('lib/images/jane-doe.jpg', fit: BoxFit.cover),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Name:', style: TextStyle(fontWeight: FontWeight.bold),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(mainState.profile.name, style: cardTextStyle),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Last Name:', style: TextStyle(fontWeight: FontWeight.bold),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(mainState.profile.lastName, style: cardTextStyle),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Age:', style: TextStyle(fontWeight: FontWeight.bold),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(mainState.profile.age.toString()),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Joined In:', style: TextStyle(fontWeight: FontWeight.bold),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(new DateFormat('yyyy-MM-dd').format(mainState.profile.joinedIn), style: cardTextStyle),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Budget:', style: TextStyle(fontWeight: FontWeight.bold),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text("${mainState.profile.budget} TL", style: cardTextStyle),
                      ),
                    ],
                  ),
                ],
            ),
            ),
        ),
      ),
      ),
    );
  }
}
