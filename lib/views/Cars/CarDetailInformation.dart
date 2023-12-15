import 'package:flutter/material.dart';
import 'package:thula_rental/views/Cars/widgets/attributes.dart';
import 'package:thula_rental/views/Cars/widgets/ratings.dart';

import '../../models/Car.dart';
import '../../utils/colors.dart';

class CarDetailsInformation extends StatelessWidget {
  const CarDetailsInformation({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
          color: Colors.grey.shade400, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          CarInfo(car: car),
          Divider(
            height: 16,
            color: Colors.black54,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    DriverInfo(),
                    SizedBox(
                      height: 12,
                    ),
                    DiverAppraise(),
                    SizedBox(
                      height: 12,
                    ),
                    DriverCall(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DriverCall extends StatelessWidget {
  const DriverCall({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            // Add your action here
            print('Button pressed!');
          },
          style: ElevatedButton.styleFrom(
            primary: btnPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
          ),
          child: Text(
            'Call',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class DiverAppraise extends StatelessWidget {
  const DiverAppraise({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '5.0',
          style: TextStyle(),
        ),
        SizedBox(
          width: 6,
        ),
        RatingBar(
          onRatingUpdate: (value) {},
          size: 14,
          selectColor: Colors.white, padding: 0,
        ),
      ],
    );
  }
}

class DriverInfo extends StatelessWidget {
  const DriverInfo({
    super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thembinkosi Tizifa',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'License NWR 369852',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '369',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Ride',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CarInfo extends StatelessWidget {
  const CarInfo({
    required this.car,
  super.key});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          'price/month',
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
              textColor: Colors.black87,
            ),
            const SizedBox(width:5),
            Attribute(
              value: car.model,
              name: 'Model No',
              textColor: Colors.black87,
            ),
            const SizedBox(width:5),
            Attribute(
              value: car.motor,
              name: 'Motor',
              textColor: Colors.black87,
            ),
            const SizedBox(width:5),
            Attribute(
              value: car.gearbox,
              name: 'GearBox',
              textColor: Colors.black87,
            ),
          ],
        )
      ],
    );
  }
}
