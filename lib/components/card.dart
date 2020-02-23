import 'package:flutter/material.dart';

class HorizonatlList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/clothes/accessories.png',
            image_caption: 'Accessories',
          ),
          Category(
            image_location: 'images/clothes/dress.png',
            image_caption: 'Dress',
          ),
          Category(
            image_location: 'images/clothes/formal.png',
            image_caption: 'Formal',
          ),
          Category(
            image_location: 'images/clothes/informal.png',
            image_caption: 'Informal',
          ),
          Category(
            image_location: 'images/clothes/jeans.png',
            image_caption: 'Jeans',
          ),
          Category(
            image_location: 'images/clothes/shoe.png',
            image_caption: 'Shoe',
          ),
          Category(
            image_location: 'images/clothes/tshirt.png',
            image_caption: 'T-shirt',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({
    this.image_location,
    this.image_caption
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){},
    child: Container(
      width: 100.0,
      child: ListTile(
        title: Image.asset(image_location, height: 80.0, width: 100.0,),
        subtitle: Container(
          alignment: Alignment.topCenter,
          child:Text(image_caption, style: new TextStyle(fontSize: 12.0),),
        ),
      ),
    ), 
    ),
    );
  }
}