import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_restaurant/data/data.dart';
import 'package:app_restaurant/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  Widget _buildCart(Order order){

      int q = order.quantity;
      return Column(
        children: <Widget>[
          Container(
             height: 150,
             width: MediaQuery.of(context).size.width,
             padding: EdgeInsets.all(16.0),
             child: Row(
               children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(order.food.imageUrl),
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(order.food.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  order.restaurant.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0
                                  ),
                              ),
                              Text(
                                  "\$${order.food.price * order.quantity}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0
                                  ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            width: 100.0,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(width: 1.0, color: Colors.grey[300])
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      q += 1;
                                      print(q.toString());
                                    });
                                  },
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 22.0
                                    ),
                                  ),
                                ),
                                Text(
                                  "$q",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "+",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20.0
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
               ],
             ),
          ),
          Divider(
            thickness: 1.0,
            height: 1.0,
            color: Colors.grey[400],
          )
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    
    double totalCost = 0;
    currentUser.cart.forEach((order){
        totalCost += order.quantity * order.food.price;
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          iconSize: 24.0,
          onPressed: () => Navigator.pop(context)
        ),
        title: Text(
            "Cart(${currentUser.cart.length})"
        ),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: currentUser.cart.length + 1,
          itemBuilder: (BuildContext context, int int){
            if(int < currentUser.cart.length){
              return _buildCart(currentUser.cart[int]);
            }
            return Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(bottom: 80.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          "Estimated Delivery Time",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                              fontSize: 16.0
                          )
                      ),
                      Text(
                          "25 Mins",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text("Total Cost",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                        )
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "\$"+totalCost.toStringAsFixed(2),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                            fontSize: 16.0
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
          bottomSheet: Container(
            alignment: Alignment.center,
            height: 80.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, -1),
                        blurRadius: 6.0
                    )
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)
              )
            ),
            child: Text(
              "CHECKOUT",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
            ),
          ),
    );
  }
}
