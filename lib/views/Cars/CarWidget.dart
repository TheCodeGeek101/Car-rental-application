import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../models/data.dart';

Widget buildCar(Car car, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 220,
    child: Expanded(
      flex:2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: btnPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: Text(
                  car.condition,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          Container(
            height: 70,
            child: Center(
              child: Hero(
                tag: car.model,
                child: Expanded(
                  child: Image.asset(
                    car.images[0],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            car.model,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            car.brand,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          Text(
            "per " + (car.condition == "Daily" ? "day" : car.condition == "Weekly" ? "week" : "month"),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
