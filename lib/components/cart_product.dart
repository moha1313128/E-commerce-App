import 'package:flutter/material.dart';

class Cart_product extends StatefulWidget {

  @override
  _Cart_productState createState() => _Cart_productState();
}

class _Cart_productState extends State<Cart_product> {
  var Products_on_the_cart = [
    {
      "name": "Jeans",
      "picture": "images/clothes/jeans.png",
      "old_price":120,
      "price":75,
      "size": "M",
      "color": "Blue",
      "quantity": 3 
    },
    {
      "name": "Shoes",
      "picture": "images/clothes/shoes.png",
      "old_price":200,
      "price":250,
      "size": "XXL",
      "color": "Black",
      "quantity": 1 
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index){
        return Single_cart_product(
          cart_prod_name: Products_on_the_cart[index]["name"],
          cart_prod_picture: Products_on_the_cart[index]["picture"],
          cart_prod_color: Products_on_the_cart[index]["color"],
          cart_prod_price: Products_on_the_cart[index]["price"],
          cart_prod_size: Products_on_the_cart[index]["size"],
          cart_prod_quantity: Products_on_the_cart[index]["quantity"],
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_quantity;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_quantity
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // Adding Image    ????????????
        // leading: new Image.asset(cart_prod_picture, width: 100.0, height: 100.0), 
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(0.0), child: new Text("Size", style: TextStyle(fontWeight: FontWeight.bold),)),
                    Padding(padding: const EdgeInsets.all(4.0), child: new Text(cart_prod_size)),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(0.0), child: new Text("Color:", style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: const EdgeInsets.all(4.0), child: new Text(cart_prod_color)),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(0.0), child: new Text("Price:", style: TextStyle(fontWeight: FontWeight.bold))),
                    // Calculate the Total price????????????
                    Padding(padding: const EdgeInsets.all(4.0), child: new Text("\$$cart_prod_price * $cart_prod_quantity", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Chosing Quantity???????
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: null),
            new Text("$cart_prod_quantity"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: null),
          ]
        ),
      ),
    );
  }
}