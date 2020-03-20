import 'package:ecommerce/components/cart_product.dart';
import 'package:flutter/material.dart';


class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navbar
      appBar: AppBar(
        backgroundColor: Colors.red,
        // centerTitle: true,
        elevation: 0.1,
        title: Text('Cart'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
        ],
      ),

      // Import 
      body: new Cart_product(),
      // Bottom
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text('Total:'),  
                subtitle: new Text('\$230'),
              )
            ),
            Expanded(
              child: new MaterialButton(onPressed: (){},
              child: new Text('Check Out', style: TextStyle(color: Colors.white),),
              color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}