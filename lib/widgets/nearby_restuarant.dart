import 'package:flutter/material.dart';
import 'package:app_restaurant/data/data.dart';
import 'package:app_restaurant/models/restaurant.dart';
import 'package:app_restaurant/screens/restaurant_screen.dart';
import 'package:app_restaurant/widgets/build_rating.dart';

class NearRestaurant extends StatefulWidget {
  @override
  _NearRestaurantState createState() => _NearRestaurantState();
}

class _NearRestaurantState extends State<NearRestaurant> {


  Widget _buildNearRestaurant(){
      List<Widget> res = [];
      restaurants.forEach((Restaurant restaurant){
        Widget r = GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => RestaurantScreen(restaurant: restaurant,))
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[200], width: 1.0),
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: restaurant.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                        image: AssetImage(restaurant.imageUrl),
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          restaurant.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3.0),
                        BuildRating(rating: restaurant.rating),
                        Text(
                          restaurant.address,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          "0.2 miles away",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: Colors.grey
                          ),
                          overflow: TextOverflow.ellipsis,

                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        res.add(r);
      });

      return Column(children: res);

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Nearby Restaurant",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        _buildNearRestaurant()

      ],
    );
  }
}
