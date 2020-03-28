import 'dart:io';
import 'package:ecommerce/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

void main() {
  if (!kIsWeb) _setTargetPlatformForDesktop();
  return runApp(MyApp());
}

void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: LoginPage()
        home: HomePage()
        // home: FloatingSearchBar.builder(
        //   pinned: true,
        //   itemCount: 100,
        //   padding: EdgeInsets.only(top: 10.0),
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       leading: Text(index.toString()),
        //     );
        //   },
        //   onChanged: (String value) {},
        //   onTap: () {},
        //   decoration: InputDecoration.collapsed(
        //     hintText: "Search...",
        //   ),
        //   leading: CircleAvatar(
        //     child: Text("RD"),
        //   ),
        //   endDrawer: Drawer(),
        // ),
        );
  }
}
