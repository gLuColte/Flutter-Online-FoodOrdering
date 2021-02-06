import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_online_foodordering/constants.dart';

class titleText extends StatelessWidget {
  const titleText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: Theme.of(context).textTheme.title.copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "Punk",
                style: TextStyle(color: kPrimaryColor)
            ),
            TextSpan(
                text: "Food",
                style: TextStyle(color:kSecondaryColor)
            )
          ]
      ),
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
      builder: (context){
        return IconButton(
          icon: SvgPicture.asset("assets/icons/notification.svg"),
          onPressed: (){
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
      builder: (context){
        return IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: (){
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
                      icon: SvgPicture.asset("assets/icons/macdonalds.svg", color: kPrimaryColor,),
                      onPressed: (){},
                    ),
                    Text("McDonalds"),
                  ],
                ),
                subtitle: Text(
                    "Your Big Mac Meal is ready to be picked up."
                ),
                trailing: Icon(Icons.more_vert),
              )
          )
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
  }) : _currentIndex = currentIndex, super(key: key);

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      items: [
        buildBottomItem(icon: Icons.home,),
        buildBottomItem(icon: Icons.favorite_border),
        buildBottomItem(icon: Icons.explore),
        buildBottomItem(icon: Icons.perm_identity),
      ],
    );
  }
}
