import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  MaterialColor white = Colors.white;
  MaterialColor black = Colors.black;
  MaterialColor grey = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: Icon(Icons.close, color: black),
        title: Text('add product', style: TextStyle(color: black),),
      )
    );
  }
}