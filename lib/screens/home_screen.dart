import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home_app/widgets/homeScreenWidgets.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: leadDrawer(),
        endDrawer: endDrawer(),
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  FontAwesomeIcons.list,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            )
          ],
        ),

        body: Column(
          children: <Widget>[
            DefaultTabController(
              length: 5,
              child: Column(
                children: <Widget>[
                  TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Theme.of(context).accentColor,
                    tabs: <Widget>[
                      Tab(icon: Icon(FontAwesomeIcons.wind)),
                      Tab(icon: Icon(FontAwesomeIcons.lightbulb)),
                      Tab(icon: Icon(FontAwesomeIcons.tree)),
                      Tab(icon: Icon(FontAwesomeIcons.tv)),
                      Tab(icon: Icon(FontAwesomeIcons.volumeUp)),
                    ],
                  ),
                  // Needed a Sized box as TabBarView requires Finite?
                  SizedBox(
                    height: 490.0,
                    child: Container(
                      child: TabBarView(
                        children: <Widget>[
                          roomTemperature(),
                          roomLights(),
                          Icon(Icons.apps),
                          Icon(Icons.apps),
                          Icon(Icons.apps),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            buildBottomItem(icon: FontAwesomeIcons.home),
            buildBottomItem(icon: FontAwesomeIcons.wallet),
            buildBottomItem(icon: FontAwesomeIcons.comments),
            buildBottomItem(icon: FontAwesomeIcons.users),
          ],
          onTap: (index){
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/first');
                print("pushed ${index.toString()}");
                break;
              case 1:
                Navigator.pushNamed(context, '/second');
                print("pushed ${index.toString()}");
                break;
              case 2:
                Navigator.pushNamed(context, '/third');
                print("pushed ${index.toString()}");
                break;
              case 3:
                Navigator.pushNamed(context, '/fourth');
                print("pushed ${index.toString()}");
                break;
            }
          },

        ),
      ),
    );
  }
}

