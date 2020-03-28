import 'package:flutter/material.dart';
import 'color.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Positioned(
        //   right: 0,
        //   top: 0,
        //   child: SizedBox(
        //     child: Image.asset('images/bg.png'),
        //     width: 250,
        //     height: 250,
        //   ),
        // ),
        Positioned(
          child: Text(
            'LOGO',
            style: TextStyle(
              fontFamily: 'Bold',
              fontSize: 24,
              color: colorText,
            ),
          ),
          right: 170,
          top: 45,
        ),
        // Positioned(
        //   top: 43,
        //   left: 31,
        //   child: Image.asset('images/logo_1.png'),
        // ),
      ],
    );
  }
}
