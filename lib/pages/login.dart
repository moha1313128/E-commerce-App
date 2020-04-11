import 'package:ecommerce/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initialState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    // Navigator.of(context).pushReplacementNamed('/home');
    if (isLogedin) {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));
      // Navigator.of(context).pushReplacementNamed('/home');
    }
    setState(() {
      loading = false;
    });
  }

  Future _handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    if (user != null) {
      // final QuerySnapshot result = await Firestore.instance.collection('users').document().setData({'id': user.uid, 'name': user.displayName, 'photo': user.photoUrl});
      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where("id", isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Insert user to collection
        Firestore.instance.collection('users').document(user.uid).setData(
            {'id': user.uid, 'name': user.displayName, 'photo': user.photoUrl});
        await preferences.setString('id', user.uid);
        await preferences.setString('name', user.displayName);
        await preferences.setString('photo', user.photoUrl);
      } else {
        await preferences.setString('id', documents[0]['id']);
        await preferences.setString('name', documents[0]['name']);
        await preferences.setString('photo', documents[0]['photo']);
      }
      Fluttertoast.showToast(msg: "Login was successful");
      setState(() {
        loading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text('Login', style: TextStyle(color: Colors.red.shade900)),
        elevation: 0.5,
      ),
      body: Stack(children: <Widget>[
        Center(
            child: FlatButton(
          color: Colors.red.shade900,
          onPressed: () {
            _handleSignIn();
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: Text('Sign in with google',
              style: TextStyle(color: Colors.white)),
        )),
        Visibility(
          visible: loading ?? true,
          child: Container(
              alignment: Alignment.center,
              color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red))),
        )
      ]),
    );
  }
}
