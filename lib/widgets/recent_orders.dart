import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_restaurant/data/data.dart';

import '../models/order.dart';


class RecentOders extends StatefulWidget {
  @override
  _RecentOdersState createState() => _RecentOdersState();
}

class _RecentOdersState extends State<RecentOders> {

  Widget _buildRecentOrder(Order order){
     return Container(
       margin: EdgeInsets.all(10.00),
       width: 320.0,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(15.0),
         border: Border.all(color: Colors.grey[200], width: 1.0)
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Expanded(
             child: Row(
               children: <Widget>[
                 ClipRRect(
                   borderRadius: BorderRadius.circular(15.0),
                   child: Image(
                     image: AssetImage(order.food.imageUrl),
                     width: 100,
                     height: 100,
                     fit: BoxFit.cover,
                   ),
                 ),
                 Expanded(
                   child: Container(
                     margin: EdgeInsets.symmetric(horizontal: 10.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(
                             order.food.name,
                             style: TextStyle(
                                 fontSize: 18.0,
                                 fontWeight: FontWeight.bold
                             ),
                             overflow: TextOverflow.ellipsis,
                         ),
                         SizedBox(height: 2.0),
                         Text(
                             order.restaurant.name,
                             style: TextStyle(
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.w600
                             ),
                             overflow: TextOverflow.ellipsis,
                         ),
                         SizedBox(height: 2.0),
                         Text(
                             order.date,
                             style: TextStyle(
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.w600
                             ),
                             overflow: TextOverflow.ellipsis,
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 20.0),
             width: 48.0,
             decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0)
             ),
             child: IconButton(
               icon: Icon(Icons.add),
               iconSize: 30.0,
               color: Colors.white,
               onPressed: (){},
             )
           )
         ],
       ),
     );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          height: 120.0,
          padding: EdgeInsets.only(left: 10.0),
          child: ListView.builder(

              scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: currentUser.orders.length,
          itemBuilder: (BuildContext context, int i){
            return Container(
              child: _buildRecentOrder(currentUser.orders[i])
            );
          }),
        )
      ],
    );
  }
}
