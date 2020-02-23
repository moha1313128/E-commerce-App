import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:ecommerce/ui/product_screen.dart';
import 'package:ecommerce/ui/product_info.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/rendering.dart';


class ListViewProduct extends StatefulWidget {

  @override
  _ListViewProductState createState() => _ListViewProductState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _ListViewProductState extends State<ListViewProduct> {
  List<Product> items;
  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangedSubscription;
  @override
  void initState(){
    super.initState();
    items = new List();
      _onProductAddedSubscription = productReference.onChildAdded.listen(_onProductAdded);
      _onProductChangedSubscription = productReference.onChildChanged.listen(_onProductChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onProductAddedSubscription.cancel();
    _onProductChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product DB',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Info'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
          padding: EdgeInsets.only(top: 20.0),
          itemBuilder: (context, position){
            return Column(
              children: <Widget>[
                Divider(height: 7.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          '${items[position].name}',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 21.0,
                    ),
                    ),
                    subtitle: Text(
                      '${items[position].description}',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 21.0,
                      ),
                    ),
                    leading: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          radius: 17.0,
                          child: Text('${position+1}',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21.0,
                          ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () => _navigateToProductInfo(context, items[position]),),),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red,),
                        onPressed: () => _deleteProduct(context, items[position], position)),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blueAccent,),
                        onPressed: () => _navigateToProduct(context, items[position])),  
                  ],
                ),
              ],
              );
          },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () => _createNewProduct(context),
        ),
      ),
    );
  }

  void _onProductAdded (Event event){
    setState(() {
      items.add(new Product.fromSnapshot(event.snapshot));
    });
  }

  void _onProductChanged (Event event){
    var oldProductValue = items.singleWhere((product)=>product.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldProductValue)] = new Product.fromSnapshot(event.snapshot);
    });
  }

  void _deleteProduct(BuildContext context, Product product,int position)async{
    await productReference.child(product.id).remove().then((_){
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToProductInfo(BuildContext context, Product product)async{
    await Navigator.push(context, 
      MaterialPageRoute(builder: (context) => ProductScreen(product)),
    );
  }

  void _navigateToProduct(BuildContext context, Product product)async{
    await Navigator.push(context, 
      MaterialPageRoute(builder: (context) => ProductInfo(product)),
    );
  }

  void _createNewProduct(BuildContext context)async{
    await Navigator.push(context, 
      MaterialPageRoute(builder: (context) => ProductScreen(Product(null, '', '', '', '', ''))),
    );
  }
}
