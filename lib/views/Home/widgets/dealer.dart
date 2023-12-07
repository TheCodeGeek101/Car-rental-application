import 'package:flutter/material.dart';

import '../../../models/Dealers.dart';
import '../../../models/Navigation.dart';

Widget buildDealer(Dealer dealer, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              dealer.image.getImageUrl(), // Assuming 'url' is the property for image URL in SanityImageSource
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          dealer.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        Text(
          '${dealer.offers} offers',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
