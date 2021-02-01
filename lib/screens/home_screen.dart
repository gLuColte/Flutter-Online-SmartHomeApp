import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.list,
                  color: Colors.black,
                ),
                Icon(
                  FontAwesomeIcons.slidersH,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            // To Be Replaced
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.wind,
                  color: Theme.of(context).accentColor,
                  size: 40.0,
                ),
                Icon(
                  FontAwesomeIcons.lightbulb,
                  color: Colors.grey,
                  size: 40.0,
                ),
                Icon(
                  FontAwesomeIcons.tree,
                  color: Colors.grey,
                  size: 40.0,
                ),
                Icon(
                  FontAwesomeIcons.tv,
                  color: Colors.grey,
                  size: 40.0,
                ),
                Icon(
                  FontAwesomeIcons.volumeUp,
                  color: Colors.grey,
                  size: 40.0,
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Expanded(
              child: Container(
                child: Center(child: Text('child')),
                color: Colors.red,
              ),
            )
          ],
      ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                size: 20.0,
                color: Colors.black,
              ),
              title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.wallet,
                size: 20.0,
                color: Colors.black,
              ),
              title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.comments,
                size: 20.0,
                color: Colors.black,
              ),
              title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.user,
                size: 20.0,
                color: Colors.black,
              ),
              title: SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}
