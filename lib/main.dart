import 'package:flutter/material.dart';
import 'package:flutter_online_foodordering/screens/home_screen.dart';
import 'constants.dart';

void main() => runApp(FoodOrdering());

class FoodOrdering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        //Set up text theme
        textTheme: TextTheme(
          body1: TextStyle(color: kSecondaryColor),
          body2: TextStyle(color: kSecondaryColor),
        )
      ),
      home: HomeScreen(),
    );
  }
}
