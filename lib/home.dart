
// import 'dart:html';
import 'package:ecommerce/components/card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}
class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget image_carousel = new Container(
    height: 200.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
        images: [
          AssetImage('images/0.jpg'),
          AssetImage('images/1.jpg'),
          AssetImage('images/2.jpg'),
          AssetImage('images/3.jpg'),
          AssetImage('images/4.jpg'),
          AssetImage('images/5.jpg'),
          AssetImage('images/5.jpg'),
          AssetImage('images/6.jpg'),
          AssetImage('images/7.jpg'),
          AssetImage('images/8.jpg'),
          AssetImage('images/9.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(microseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotColor: Colors.red,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // centerTitle: true,
        elevation: 0.0,
        title: Text('Shop List'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){}),
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
          // header
          new UserAccountsDrawerHeader(accountName: Text('WebDev'), accountEmail: Text('moha1313128@gmail.com'),
          currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('images/id.jpg'),
                // child: Icon(Icons.person, color: Colors.white),
              ),
          ),
          decoration: new BoxDecoration(
            color: Colors.red,
          ),
          ), 
          // Body
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My account'),
              leading: Icon(Icons.person, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My orders'),
              leading: Icon(Icons.shopping_basket, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.dashboard, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
          Divider(),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.question_answer, color: Colors.blue),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app, color: Colors.purple),
            ),
          ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          image_carousel,
          new Padding(padding: const EdgeInsets.all(8.0),
          // child: new Text('Categories'),
          ),
          //Cards
          HorizonatlList(),
        ],
      )
    );
  }
}