import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/images/living_room.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Choose Your Favorite Room',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              )),
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Smart home with facilities of smart devices in Each room with intelligent system.',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              )),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 2,
                                children: <Widget>[
                                  buildBox(context: context, icon: FontAwesomeIcons.couch, text: 'Living Room', iconColor: Colors.white, backgroundColor: Theme.of(context).accentColor),
                                  buildBox(context: context, icon: FontAwesomeIcons.bath, text: 'Bathroom', iconColor: Theme.of(context).accentColor, backgroundColor: Colors.white),
                                  buildBox(context: context, icon: FontAwesomeIcons.baby, text: 'Bathroom', iconColor: Theme.of(context).accentColor, backgroundColor: Colors.white),
                                  buildBox(context: context, icon: FontAwesomeIcons.bookReader, text: 'Bathroom', iconColor: Theme.of(context).accentColor, backgroundColor: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Build Bottom Bar Items
Padding buildBox({BuildContext context, IconData icon, String text, Color iconColor, Color backgroundColor}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 30,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(text, style: TextStyle(fontSize: 15.0, color: iconColor),)
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
