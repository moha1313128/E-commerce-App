import 'package:flutter/material.dart';

class Drawer extends StatefulWidget {

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
      );
  }
}