
import 'package:flutter/material.dart';

import '../../../models/Car.dart';
import '../../../utils/colors.dart';
import 'attributes.dart';

class CarInfomation extends StatelessWidget {
  const CarInfomation({
    required this.car, super.key});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 24, right: 24,top: 50),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$${car.price}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'price/hr',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Attribute(
                value: car.brand,
                name: 'Brand',
              ),
              Attribute(
                value: car.model,
                name: 'Model No',
              ),
              Attribute(
                value: car.motor,
                name: 'Motor',
              ),
              Attribute(
                value: car.gearbox,
                name: 'GearBox.',
              ),
            ],
          )
        ],
      ),
    );
  }
}