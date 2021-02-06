import 'package:flutter/material.dart';
import 'package:flutter_online_foodordering/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderingButton extends StatelessWidget {
  const OrderingButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
          child: OrderButton(
            size: size,
            press: () {},
          )
      ),
    );
  }
}

class DetailsField extends StatelessWidget {
  const DetailsField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        child: Text(
          "Nowadays, making printed materials have become fast, easy and simple. If you want your promotional material to be an eye-catching object, you should make it colored. By way of using inkjet printer this is not hard to make. An inkjet printer is any printer that places extremely small droplets of ink onto paper to create an image.",
          style: TextStyle(
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

class LocationLine extends StatelessWidget {
  const LocationLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.gps_fixed,
              color: Colors.grey,
              size: 15,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "MacDonalds",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.get_app,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      child: Image(
        image: AssetImage('assets/images/burger.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


Row shopeName({String name}) {
  return Row(
    children: <Widget>[
      Icon(
        Icons.location_on,
        color: kSecondaryColor,
      ),
      SizedBox(width: 10),
      Text(name),
    ],
  );
}

// Build Bottom Bar Items
Padding buildBox(
    {BuildContext context,
      IconData icon,
      String text,
      Color iconColor,
      Color backgroundColor}) {
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
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 15.0, color: iconColor),
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}

//From Original

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key key,
    @required this.size,
    this.press,
  }) : super(key: key);

  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      width: size.width * 0.8,
      // it will cover 80% of total width
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/icons/bag.svg"),
                SizedBox(width: 10),
                Text(
                  "Order Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}