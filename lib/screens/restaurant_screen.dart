import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_restaurant/models/food.dart';
import 'package:app_restaurant/models/restaurant.dart';
import 'package:app_restaurant/widgets/build_rating.dart';

class RestaurantScreen extends StatefulWidget {

  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  Widget _buildFoodGridView(Food food){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
            Container(
              height: 170.0,
              width: 170.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(food.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
            Container(
              height: 170.0,
              width: 170.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black26.withOpacity(0.3)
                    ]
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
            Positioned(
              bottom: 65.0,
              child: Column(
                children: <Widget>[
                  Text(
                    food.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                      '\$'+food.price.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600
                      )
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Container(
                  width: 45.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(27.0)
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: (){},
                  )
              ),
            )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
            Stack(
              children: <Widget>[
                  Hero(
                    tag: widget.restaurant.imageUrl,
                    child: Image(
                        image: AssetImage(widget.restaurant.imageUrl),
                        width: MediaQuery.of(context).size.width,
                        height: 220.0,
                        fit: BoxFit.cover
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 24.0,
                          onPressed: () => Navigator.pop(context)
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite),
                          color: Theme.of(context).primaryColor,
                          iconSize: 24.0,
                          onPressed: (){},
                        )
                      ],
                    ),
                  )
              ],
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                      ),
                      Text(
                        "0.2 miles away",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BuildRating(rating: widget.restaurant.rating),
                      SizedBox(height: 3.0),
                      Text(
                        widget.restaurant.address,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: (){},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 3.0),

                      ),
                      RaisedButton(
                        child: Text(
                            "Contacts",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: (){},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 3.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Center(
                child: Text(
                  "Menu",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0
                  ),
                )
            ),
            SizedBox(height: 5.0,),
            Expanded(
              child: GridView.count(
                  padding: EdgeInsets.all(10.0),
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(widget.restaurant.menu.length, (index){
                    return _buildFoodGridView(widget.restaurant.menu[index]);
                  })
              ),
      )
        ]
      ),

    );
  }
}
