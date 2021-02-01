import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home_app/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Drawer
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  // Build Bottom Bar Items
  BottomNavigationBarItem _buildBottomItem({IconData icon}){
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          size: 20.0,
          color: Colors.black,
        ),
        title: SizedBox.shrink()
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: leadDrawer(),
        endDrawer: endDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context){
              return IconButton(
                icon: Icon(FontAwesomeIcons.list, color: Colors.black,),
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            Builder(
              builder: (context){
                return IconButton(
                  icon: Icon(Icons.person, color: Colors.black,),
                  onPressed: (){
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: DefaultTabController(
                length: 5,
                child: Scaffold(
                  appBar: AppBar(
                    bottomOpacity: 0.0,
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    title: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Theme.of(context).accentColor,
                      tabs: <Widget>[
                        Tab(icon: Icon(FontAwesomeIcons.wind)),
                        Tab(icon: Icon(FontAwesomeIcons.lightbulb)),
                        Tab(icon: Icon(FontAwesomeIcons.tree)),
                        Tab(icon: Icon(FontAwesomeIcons.tv)),
                        Tab(icon: Icon(FontAwesomeIcons.volumeUp)),
                      ],
                    )
                  ),
                  body: TabBarView(
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
            ),
          ],
        ),
        // TODO: Need to be replaced with a Clickable widget that opens to another window
        bottomNavigationBar: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          items: [
            _buildBottomItem(icon: FontAwesomeIcons.home),
            _buildBottomItem(icon: FontAwesomeIcons.wallet),
            _buildBottomItem(icon: FontAwesomeIcons.comments),
            _buildBottomItem(icon: FontAwesomeIcons.users),
          ],
        ),
      ),
    );
  }
}

class leadDrawer extends StatelessWidget {
  // Build Bottom Bar Items
  ListTile _buildTile({BuildContext context, IconData icon, String text}){
    return ListTile(
        leading: Icon(icon,),
        title: Text(text),
        onTap: () => {Navigator.of(context).pop()},
    );
  }
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
          _buildTile(context: context, icon : Icons.input, text: 'Welcome'),
          _buildTile(context: context, icon : Icons.verified_user, text: 'Profile'),
          _buildTile(context: context, icon : Icons.settings, text: 'Settings'),
          _buildTile(context: context, icon : Icons.border_color, text: 'Feedback'),
          _buildTile(context: context, icon : Icons.exit_to_app, text: 'Logout'),
        ],
      ),
    );
  }
}

class endDrawer extends StatelessWidget {
  // Build Bottom Bar Items
  ListTile _buildTile({BuildContext context, IconData icon, String text}){
    return ListTile(
      leading: Icon(icon,),
      title: Text(text),
      onTap: () => {Navigator.of(context).pop()},
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Right Side menu',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ),
          _buildTile(context: context, icon : Icons.input, text: 'Welcome'),
          _buildTile(context: context, icon : Icons.verified_user, text: 'Profile'),
          _buildTile(context: context, icon : Icons.settings, text: 'Settings'),
          _buildTile(context: context, icon : Icons.border_color, text: 'Feedback'),
          _buildTile(context: context, icon : Icons.exit_to_app, text: 'Logout'),
        ],
      ),
    );
  }
}