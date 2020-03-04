import 'package:ecommerce/pages/products_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list = [
    {
      "name": "Accessoires",
      "picture": "images/clothes/accessories.png",
      "old_price":120,
      "price":75,
    },
    {
      "name": "Dress",
      "picture": "images/clothes/dress.png",
      "old_price":100,
      "price":50,
    },
    {
      "name": "Jeans",
      "picture": "images/clothes/jeans.png",
      "old_price":200,
      "price":150,
    },
    {
      "name": "Formal",
      "picture": "images/clothes/formal.png",
      "old_price":200,
      "price":150,
    },
    {
      "name": "Informal",
      "picture": "images/clothes/informal.png",
      "old_price":200,
      "price":150,
    },
    {
      "name": "Shoes",
      "picture": "images/clothes/shoe.png",
      "old_price":200,
      "price":150,
    },
    {
      "name": "T-Shirt",
      "picture": "images/clothes/tshirt.png",
      "old_price":200,
      "price":150,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index){
        return Single_prod(
          prod_name: products_list[index]['name'],
          prod_picture: products_list[index]['picture'],
          prod_old_price: products_list[index]['old_price'],
          prod_price: products_list[index]['price'],
        ); 
      });
  }
}
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name, 
        child: Material(
        child: InkWell(
          onTap: ()=> Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context)=> new ProductDetails(
            prod_detail_name: prod_name, 
            prod_detail_old_price: prod_old_price, 
            prod_detail_picture: prod_picture, 
            prod_detail_price: prod_price,
          ),
          )),
        child: GridTile(
          footer: Container(
            color: Colors.white60,
            ////---- First Footer Style ----////
            // child: ListTile(
            //   leading: Text(
            //     prod_name, 
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   title: Text("\$$prod_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
            //   subtitle: Text("\$$prod_old_price", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough)),
            // ),
            ////---- Seconde Footer Style ----////
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: Text(prod_name, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                ),
                new Text("\$$prod_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                new Text(" \$$prod_old_price", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough),),
              ],
            ),
          ),
          child: Image.asset(prod_picture, fit: BoxFit.none),
        ),
        ),
      )),
    );
  }
}
