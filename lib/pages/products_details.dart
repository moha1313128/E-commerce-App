import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final prod_detail_name;
  final prod_detail_picture;
  final prod_detail_old_price;
  final prod_detail_price;

  ProductDetails({
    this.prod_detail_name,
    this.prod_detail_picture,
    this.prod_detail_old_price,
    this.prod_detail_price,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // centerTitle: true,
        elevation: 0.0,
        // title: Text("Shop List"),
        title: new Text(widget.prod_detail_name),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.prod_detail_picture),
              ),
            footer: new Container(
              color: Colors.white60,
              child: ListTile(
                leading: new Text(widget.prod_detail_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                title: new Row(
                  children: <Widget>[
                    Expanded(
                      // child: null,
                      child: new Text("New Price \$${widget.prod_detail_price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0),),
                    ),
                     Expanded(
                      // child: null,
                      child: new Text("Old Price \$${widget.prod_detail_old_price}", style: TextStyle(color: Colors.grey, fontSize: 16.0, decoration: TextDecoration.lineThrough),),
                    )
                  ],
                ),
              )
            ),  
            ),
          ),
          ////------- The Size  -------////
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text('Size'),
                        content: new Text('Chose your Size'),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){Navigator.of(context).pop(context);},
                          child: new Text('close', style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text('Size'),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ]
                  ),
              ),
              ),
              ////------- The Colors  -------////
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text('Colors'),
                        content: new Text('Chose your colors'),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){Navigator.of(context).pop(context);},
                          child: new Text('close', style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text('Colors'),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ]
                  ),
              ),
              ),
              ////------- The Quantity  -------////
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text('Quantity'),
                        content: new Text('Chose your quantity'),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){Navigator.of(context).pop(context);},
                          child: new Text('close', style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text('Qty'),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ]
                  ),
              ),
              ),
            ]
          ),

          ////------- The Buy Button  -------////
           Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  elevation: 0.3,
                  textColor: Colors.white,
                  child: new Text("Buy Now"),
                ),
              ),

              ////------- The  -------////
              new IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart, color: Colors.red)),

              new IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border, color: Colors.red)),
            ],
          ),
          ////------- The Description of the product -------////
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text('Product Name', style: TextStyle(color: Colors.grey)),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.prod_detail_name),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text('Product Brand', style: TextStyle(color: Colors.grey)),),
              ////------- The product brand -------////
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text('Brand X'),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text('Product Condition', style: TextStyle(color: Colors.grey)),),
              ////------- The product condition -------////
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text('New'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}