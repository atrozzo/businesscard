import 'package:flutter/material.dart';
import 'package:businesscard/services/calls_and_messages_service.dart';
import 'package:businesscard/services/service_locator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  setupLocator();

  runApp(
    MyApp()
  );
}


class MyApp extends StatelessWidget {

  final String number = "Telephone number";
  final String email = "email";
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[300],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/0.jpeg'),
              ),
              Text('Angelo Trozzo',
                style: TextStyle(color: Colors.white,
                fontSize: 40.0,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold),
              ),
              Text('Software Engineer',
                style: TextStyle(color: Colors.teal.shade100,
                    fontSize: 20.0,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox( height: 20.0, width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading:
                  Icon(Icons.phone,
                    color: Colors.teal,
                  ),
                  onLongPress: (){
                    print("pressed make call");
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

              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading:
                  Icon(Icons.email,
                    color: Colors.teal,
                  ),
                  onLongPress: (){
                    print("pressed send email");
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
              ])

            ],
          ),
        ),
      ),
    );
  }
}


