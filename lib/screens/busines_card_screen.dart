import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:businesscard/services/service_locator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/calls_and_messages_service.dart';

class BusinessCardScreen extends StatelessWidget {
  // This widget is the root of your application.
  final String number = "Telephone number";
  final String email = "email";

  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal[300],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _getBoxedRow(),
            Row(
              //Row 1 with the image
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/0.jpeg'),
                )
              ],
            ),
            _getBoxedRow(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                'Angelo Trozzo',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Software Engineer',
                  style: TextStyle(
                    color: Colors.teal.shade100,
                    fontSize: 20.0,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
              ],
            ),
            _getBoxedRow(),
            _getBoxedRow(),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading:
                  Icon(Icons.email,
                    color: Colors.teal,
                  ),
                  onLongPress: (){
                    _service.launchEmail(email,"info", "this is test");
                  },
                  title: Text(email,
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0
                    ),
                  ),
                )
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
              child: ListTile(
                leading:
                Icon(Icons.phone,
                  color: Colors.teal,
                ),
                onLongPress: (){
                  _service.call(number);
                },
                title: Text(
                  number,
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            _getBoxedRow(),
            _getBoxedRow(),
            Row(
              mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    color: Colors.indigo,
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: (){
                      _service.launchURL("https://github.com/atrozzo");
                    },
                  ),
                  IconButton(
                    color: Colors.indigo,
                    icon: Icon(FontAwesomeIcons.linkedin),
                    onPressed: (){
                      _service.launchURL("https://www.linkedin.com/in/trozzo/");
                    },
                  )
                ]
            )
          ],
        ),
      ),
    ));
  }


  Row _getBoxedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 40.0,
          child: Divider(
            color: Colors.teal.shade100,
          ),
        ),
      ],
    );
  }
}
