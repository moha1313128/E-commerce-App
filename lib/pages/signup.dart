import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/auth/LoginRequest.dart';
import 'package:ecommerce/auth/login_screen.dart';
import 'package:ecommerce/auth/validation.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../db/users.dart';

class SignUp extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    return new _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  LoginRequestData _loginData = LoginRequestData();
  bool _obscureText = true;
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _passwordConfirmTextController =
      TextEditingController();
  String gender;
  String groupValue = 'male';
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // UserServices _userServices = UserServices();
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(20.0),
            child: Center(
              child: new Form(
                key: _key,
                autovalidate: _validate,
                child: _getFormUI(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getFormUI() {
    return new Column(
      children: <Widget>[
        CircularProfileAvatar(
          '',
          child: FlutterLogo(),
          borderWidth: 5,
          elevation: 2,
          radius: 50,
        ),
        // new FlutterLogo(),
        new SizedBox(height: 20.0),
        new TextFormField(
          controller: _nameTextController,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Nick Name',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          // validator: FormValidator().validateName,
          onSaved: (String value) {
            _loginData.name = value;
          },
        ),
        new SizedBox(height: 8.0),

        new Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio(
                  value: "male",
                  groupValue: groupValue,
                  onChanged: (e) => valueChanged(e),
                ),
                Text("Male")
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: "female",
                  groupValue: groupValue,
                  onChanged: (e) => valueChanged(e),
                ),
                Text("Female")
              ],
            ),
          ],
        ),

        new SizedBox(height: 8.0),
        new TextFormField(
          controller: _emailTextController,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          validator: FormValidator().validateEmail,
          onSaved: (String value) {
            _loginData.email = value;
          },
        ),
        new SizedBox(height: 8.0),
        new TextFormField(
            controller: _passwordTextController,
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
            validator: FormValidator().validateConfirmPassword,
            onSaved: (String value) {
              _loginData.password = value;
            }),
        new SizedBox(height: 8.0),
        new TextFormField(
            controller: _passwordConfirmTextController,
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
            validator: FormValidator().validatePassword,
            onSaved: (String value) {
              _loginData.passwordConfirm = value;
            }),
        new SizedBox(height: 8.0),
        new Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              signUp();
            },
            padding: EdgeInsets.all(12),
            color: Colors.lightBlueAccent,
            child: Text('Sign Up', style: TextStyle(color: Colors.white)),
          ),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            padding: EdgeInsets.all(12),
            color: Colors.lightBlueAccent,
            child: Text('Sign In', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Email ${_loginData.email}");
      print("Password ${_loginData.password}");
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
      } else if (e == "female") {
        groupValue = e;
      }
    });
  }

  // Future validateForm() async {
  //   FormState formState = _key.currentState;
  //   if (formState.validate()) {
  //     // formState.reset();
  //     FirebaseUser user = await _auth.currentUser();
  //     if (user == null) {
  //       _auth
  //           .createUserWithEmailAndPassword(
  //               email: _emailTextController.text,
  //               password: _passwordTextController.text)
  //           .then((user) => {
  //                 _userServices.createUser(user.uid.toString(), {
  //                   "username": user.displayName,
  //                   "email": user.email,
  //                   "userId": user.uid,
  //                   "gender": gender,
  //                 })
  //               })
  //           .catchError((err) => {print(err.toString())});
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => HomePage()));
  //     }
  //   }
  // }

  Future signUp() async {
    FormState formState = _key.currentState;
    if (formState.validate()) {
      FirebaseUser user = await _auth.currentUser();
      if (user == null) {
        _auth.createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text);
        Firestore.instance.collection('users').document().setData({
          'userid': user.uid,
          'displayName': user.displayName,
          'email': user.email
        });
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomePage()));
        Navigator.pushNamed(context, '/home');
      }
    }
  }
}
