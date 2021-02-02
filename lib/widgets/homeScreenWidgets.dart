import 'package:custom_switch/custom_switch.dart';
import 'package:flutter_knob/flutter_knob.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class roomTemperature extends StatefulWidget {
  @override
  _roomTemperatureState createState() => _roomTemperatureState();
}

class _roomTemperatureState extends State<roomTemperature> {
  //Variables
  int speed = 1;
  bool onOffToggle = false;
  double _value = 16.0;
  void _setValue(double value) => setState(() => _value = value);
  static const double minValue = 16;
  static const double maxValue = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Expanded(
                flex: 4,
                child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DashedContainer(
                            dashColor: Theme.of(context).accentColor,
                            boxShape: BoxShape.circle,
                            dashedLength: 3.0,
                            blankLength: 3.0,
                            strokeWidth: 3.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Knob(
                                value: _value,
                                color: Color(0xFF494949),
                                onChanged: _setValue,
                                min: minValue,
                                max: maxValue,
                                size: 170,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Icon(FontAwesomeIcons.plus, size: 15, color: Theme.of(context).accentColor,),
                        top: 115,
                        left: 0.0,
                      ),
                      Positioned(
                        child: Icon(FontAwesomeIcons.minus, size: 15, color: Theme.of(context).accentColor,),
                        top: 115,
                        right: 0.0,
                      ),

                      Container(
                        width: 120,
                        height: 120,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text('${_value.toStringAsFixed(0)} C', style: TextStyle(color: Colors.white, fontSize: 30),)),
                      )

                    ]
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Container(
              width: 300,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Wind Speed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomSwitch(
                activeColor: Theme.of(context).accentColor,
                value: onOffToggle,
                onChanged: (value) {
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
                ),
              ),
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

class roomLights extends StatefulWidget {
  @override
  _roomLightsState createState() => _roomLightsState();
}

class _roomLightsState extends State<roomLights> {

  // Variables
  bool light = false;

  Row _buildRow({String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        SizedBox(width: 15,),
        CustomSwitch(
          activeColor: Theme.of(context).accentColor,
          value: light,
          onChanged: (value) {
            setState(() {
              light = value;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRow(text: 'Light 1 :'),
                _buildRow(text: 'Light 2 :'),
                _buildRow(text: 'Light 3 :'),
                _buildRow(text: 'Light 4 :'),
                _buildRow(text: 'Light 5 :'),
                _buildRow(text: 'Light 6 :'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
