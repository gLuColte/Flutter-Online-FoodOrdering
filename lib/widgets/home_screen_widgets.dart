import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_online_foodordering/constants.dart';
import 'package:flutter_online_foodordering/screens/detailed_screen.dart';


class titleText extends StatelessWidget {
  const titleText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: "Punk", style: TextStyle(color: kPrimaryColor)),
            TextSpan(text: "Food", style: TextStyle(color: kSecondaryColor))
          ]),
    );
  }
}

class trailingDrawer extends StatelessWidget {
  const trailingDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return IconButton(
          icon: SvgPicture.asset("assets/icons/notification.svg"),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        );
      },
    );
  }
}

class leadingDrawer extends StatelessWidget {
  const leadingDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
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

ListTile buildTile({BuildContext context, IconData icon, String text}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Theme.of(context).primaryColor,
    ),
    title: Text(text),
    onTap: () => {Navigator.of(context).pop()},
  );
}

class endDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Notifications',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ),
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(15.0),
              title: Row(
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/macdonalds.svg",
                      color: kPrimaryColor,
                    ),
                    onPressed: () {},
                  ),
                  Text("McDonalds"),
                ],
              ),
              subtitle: Text("Your Big Mac Meal is ready to be picked up."),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}

class leadDrawer extends StatelessWidget {
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
                      style: TextStyle(fontSize: 20, color: Colors.black),
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

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  final onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SvgPicture.asset("assets/icons/search.svg"),
          hintText: "Search Here",
          hintStyle: TextStyle(color: kSecondaryColor),
        ),
      ),
    );
  }
}

class bottomBar extends StatelessWidget {
  const bottomBar({
    Key key,
    @required int currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      items: [
        buildBottomItem(
          icon: Icons.home,
        ),
        buildBottomItem(icon: Icons.favorite_border),
        buildBottomItem(icon: Icons.explore),
        buildBottomItem(icon: Icons.perm_identity),
      ],
    );
  }
}

class DiscountTab extends StatelessWidget {
  const DiscountTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Offers & Discounts",
              style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  BuildDiscountCard(
                      backgroundImagePath:
                          "assets/images/beyond-meat-mcdonalds.png",
                      iconPath: "assets/icons/macdonalds.svg",
                      discount: "30% \n",
                      bottomText:
                          "at MacDonald's on Big Mac or first meal orders."),
                  BuildDiscountCard(
                      backgroundImagePath:
                          "assets/images/beyond-meat-mcdonalds.png",
                      iconPath: "assets/icons/macdonalds.svg",
                      discount: "80% \n",
                      bottomText: "at MacDonald's on Big Mac."),
                  BuildDiscountCard(
                      backgroundImagePath:
                          "assets/images/beyond-meat-mcdonalds.png",
                      iconPath: "assets/icons/macdonalds.svg",
                      discount: "99% \n",
                      bottomText: "at MacDonald's on first meal orders.")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildDiscountCard extends StatelessWidget {
  BuildDiscountCard(
      {@required this.backgroundImagePath,
      @required this.iconPath,
      @required this.discount,
      @required this.bottomText});
  String backgroundImagePath;
  String iconPath;
  String discount;
  String bottomText;

  Widget build(BuildContext context) {
    return SizedBox(
        width: 320,
        height: 170,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(backgroundImagePath))),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Color(0xFFFF961F).withOpacity(0.7),
                    kPrimaryColor.withOpacity(0.7),
                  ])),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SvgPicture.asset(iconPath),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                    text: "Get Discount of \n",
                                    style: TextStyle(fontSize: 16)),
                                TextSpan(
                                    text: discount,
                                    style: TextStyle(
                                        fontSize: 43,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: bottomText,
                                    style: TextStyle(fontSize: 10)),
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


class OfferTab extends StatelessWidget {
  const OfferTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: DefaultTabController(
        length: 6,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: kSecondaryColor,
                labelColor: Colors.black,
                indicatorColor: kPrimaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Specials'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Combo Meals'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Warm Meals'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Cold Meals'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Vegetarian Meals'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Beverages & Drinks'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: TabBarView(
                  children: <Widget>[
                    MiddleTabBuilder(iconPath: "assets/icons/burger_beer.svg", foodText: "Burger & Beer", restaurantText: "McDonald's", iconWidth: 60,),
                    MiddleTabBuilder(iconPath: "assets/icons/chinese_noodles.svg", foodText: "Spicy Ramen", restaurantText: "KFC",iconWidth: 70,),
                    MiddleTabBuilder(iconPath: "assets/icons/burger_beer.svg", foodText: "Burger & Beer", restaurantText: "McDonald's", iconWidth: 60,),
                    MiddleTabBuilder(iconPath: "assets/icons/chinese_noodles.svg", foodText: "Spicy Ramen", restaurantText: "KFC",iconWidth: 70,),
                    MiddleTabBuilder(iconPath: "assets/icons/burger_beer.svg", foodText: "Burger & Beer", restaurantText: "McDonald's", iconWidth: 60,),
                    MiddleTabBuilder(iconPath: "assets/icons/chinese_noodles.svg", foodText: "Spicy Ramen", restaurantText: "KFC",iconWidth: 70,),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class MiddleTabBuilder extends StatelessWidget {
  MiddleTabBuilder({@required this.iconPath,@required this.foodText, @required this.restaurantText, @required this.iconWidth});

  String iconPath;
  String foodText;
  String restaurantText;
  double iconWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          BuildMiddleTabItem(iconPath: iconPath, foodText: foodText, restaurantText: restaurantText, iconWidth: iconWidth,),
          BuildMiddleTabItem(iconPath: iconPath, foodText: foodText, restaurantText: restaurantText, iconWidth: iconWidth,),
          BuildMiddleTabItem(iconPath: iconPath, foodText: foodText, restaurantText: restaurantText, iconWidth: iconWidth,),
          BuildMiddleTabItem(iconPath: iconPath, foodText: foodText, restaurantText: restaurantText, iconWidth: iconWidth,),
          BuildMiddleTabItem(iconPath: iconPath, foodText: foodText, restaurantText: restaurantText, iconWidth: iconWidth,),
          BuildMiddleTabItem(iconPath: iconPath, foodText: foodText, restaurantText: restaurantText, iconWidth: iconWidth,),
          BuildMiddleTabItem(iconPath: iconPath, foodText: foodText, restaurantText: restaurantText, iconWidth: iconWidth,),
        ],
      ),
    );
  }
}

class BuildMiddleTabItem extends StatelessWidget {

  BuildMiddleTabItem({@required this.iconPath,@required this.foodText, @required this.restaurantText, @required this.iconWidth});

  String iconPath;
  String foodText;
  String restaurantText;
  double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 0, 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,4),
              blurRadius: 20,
              color: Color(0xFFB0CCE1).withOpacity(0.52),
            )
          ]
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen();
                }
              )
            );
          },
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    iconPath,
                    width: iconWidth,
                    // size.width * 0.18 means it use 18% of total width
                  ),
                ),
                Text(foodText),
                SizedBox(height: 10),
                Text(
                  restaurantText,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

