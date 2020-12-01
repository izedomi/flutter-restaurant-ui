import 'package:flutter/material.dart';
import 'package:app_restaurant/screens/cart_screen.dart';
import 'package:app_restaurant/widgets/nearby_restuarant.dart';

import '../widgets/recent_orders.dart';
import '../data/data.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.account_circle),
            title: Text(
              "Food Delivery"
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Cart(${currentUser.orders.length})",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen())),
              )
            ],
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    hintText: "Search Food or Restaurants",
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (){},
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: (){},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 0.8
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            width: 0.8,
                            color: Theme.of(context).primaryColor
                        )
                    ),
                  ),
                ),
              ),
              RecentOders(),
              SizedBox(height: 10.0),
              NearRestaurant()
            ],
          ),
    );
  }
}
