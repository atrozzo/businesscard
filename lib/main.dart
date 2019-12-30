import 'package:businesscard/screens/busines_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:businesscard/services/service_locator.dart';

void main() {
  setupLocator();

  runApp(BusinessCardApp());
}

class BusinessCardApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new BusinessCardScreen(),
    );
  }

}