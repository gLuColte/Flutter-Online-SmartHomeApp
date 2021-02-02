import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_knob/flutter_knob.dart';

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
          backgroundColor: Colors.white,
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
                        color: Colors.red,
                        child: TabBarView(
                          children: <Widget>[
                            Icon(Icons.apps),
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
