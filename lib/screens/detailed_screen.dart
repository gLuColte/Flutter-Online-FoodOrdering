import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_online_foodordering/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_online_foodordering/widgets/detailed_screen_widgets.dart';

class DetailsScreen extends StatelessWidget {

  // From Original
  ClipPath priceTag(BuildContext context, {int price}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 20),
        height: 66,
        width: 65,
        color: kPrimaryColor,
        child: Text(
          "\$$price",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            BackgroundImage(),
            TopAppBar(),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 410,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          LocationLine(),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Cheese Burger", style: Theme.of(context).textTheme.headline,),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: <Widget>[
                                            SmoothStarRating(
                                              borderColor: kPrimaryColor,
                                              rating: 4,
                                              size: 20,
                                            ),
                                            SizedBox(width: 10),
                                            Text("20 reviews"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: priceTag(context, price: 15),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          DetailsField(),
                          OrderingButton(size: size),
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
