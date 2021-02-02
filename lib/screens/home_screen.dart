import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_switch/custom_switch.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                          Icon(Icons.apps),
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

        // TODO: Need to be replaced with a Clickable widget that opens to another window
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            buildBottomItem(icon: FontAwesomeIcons.home),
            buildBottomItem(icon: FontAwesomeIcons.wallet),
            buildBottomItem(icon: FontAwesomeIcons.comments),
            buildBottomItem(icon: FontAwesomeIcons.users),
          ],
        ),
      ),
    );
  }
}

class roomTemperature extends StatefulWidget {
  @override
  _roomTemperatureState createState() => _roomTemperatureState();
}

class _roomTemperatureState extends State<roomTemperature> {
  //Variables
  int speed = 1;
  bool onOffToggle = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // TODO: Knob Controller
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.green,
          ),
        ),
        // TODO: Wind Speed Controler
        Expanded(
          flex: 2,
          child: Container(
              child: Container(
            width: 300,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Center(child: Text('Wind Speed', style: TextStyle(fontWeight: FontWeight.bold),)),
                Expanded(
                  child: SizedBox(
                    width: 250,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0XFF8D8E98),
                          activeTrackColor: Theme.of(context).accentColor,
                          thumbColor: Theme.of(context).accentColor,
                          overlayColor: Theme.of(context).accentColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 6.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 8.0)),
                      child: Slider(
                        value: speed.toDouble(),
                        min: 1.0,
                        max: 5.0,
                        onChanged: (double newValue) {
                          setState(() {
                            speed = newValue.round();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Low',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Medium',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'High',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          )),
        ),
        // TODO: On Off button
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomSwitch(
                activeColor: Theme.of(context).accentColor,
                value: onOffToggle,
                onChanged: (value){
                  print("VALUE : $value");
                  setState(() {
                    onOffToggle = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

}

// Build Bottom Bar Items
BottomNavigationBarItem buildBottomItem({IconData icon}) {
  return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 20.0,
        color: Colors.black,
      ),
      title: SizedBox.shrink());
}

// Build Bottom Bar Items
ListTile buildTile({BuildContext context, IconData icon, String text}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Theme.of(context).accentColor,
    ),
    title: Text(text),
    onTap: () => {Navigator.of(context).pop()},
  );
}

class leadDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Left Side menu',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ),
          buildTile(context: context, icon: Icons.input, text: 'Welcome'),
          buildTile(
              context: context, icon: Icons.verified_user, text: 'Profile'),
          buildTile(context: context, icon: Icons.settings, text: 'Settings'),
          buildTile(
              context: context, icon: Icons.border_color, text: 'Feedback'),
          buildTile(context: context, icon: Icons.exit_to_app, text: 'Logout'),
        ],
      ),
    );
  }
}

class endDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
                  ),
                  Text(
                    'Jonathan',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
            ),
            buildTile(context: context, icon: Icons.input, text: 'Welcome'),
            buildTile(
                context: context, icon: Icons.verified_user, text: 'Profile'),
            buildTile(context: context, icon: Icons.settings, text: 'Settings'),
            buildTile(
                context: context, icon: Icons.border_color, text: 'Feedback'),
            buildTile(
                context: context, icon: Icons.exit_to_app, text: 'Logout'),
          ],
        ),
      ),
    );
  }
}
