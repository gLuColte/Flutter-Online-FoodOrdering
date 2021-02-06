import 'package:flutter/material.dart';
import 'package:flutter_online_foodordering/constants.dart';
import 'package:flutter_online_foodordering/widgets/home_screen_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueChanged<String> onChanged;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: leadDrawer(),
        endDrawer: endDrawer(),
        // appBar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: leadingDrawer(),
          centerTitle: true,
          title: titleText(),
          actions: <Widget>[
            trailingDrawer()
          ],
        ),
        // Body
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchBox(onChanged: onChanged),
            ],
          ),
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: bottomBar(currentIndex: _currentIndex),
      ),
    );
  }
}
