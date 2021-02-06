import 'package:flutter/material.dart';
import 'package:flutter_online_foodordering/widgets/home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueChanged<String> onChanged;
  int _currentIndex = 0;
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: leadDrawer(),
        endDrawer: endDrawer(),
        // appBar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: leadingDrawer(),
          centerTitle: true,
          title: titleText(),
          actions: <Widget>[trailingDrawer()],
        ),
        // Body
        body: Column(
          children: <Widget>[
            Expanded(flex: 1, child: SearchBox(onChanged: onChanged)),
            Expanded(
              flex: 5,
              child: Column(
                children: <Widget>[
                  OfferTab(),
                  DiscountTab(),
                ],
              ),
            ),
          ],
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: bottomBar(currentIndex: _currentIndex),
      ),
    );}
}
