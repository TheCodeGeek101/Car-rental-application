import 'package:flutter/material.dart';

import '../../../models/Car.dart';
import 'CarCard.dart';

class ScrollableCars extends StatelessWidget {
  ScrollableCars({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.width * 0.25,
        child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context, index) {
            return CarCard(
              width: (size.width - 16 * 3)/2,
              height: ((size.width - 16 *3)/2) * 0.4,
              title: cars[index].name,
              subTitle: "${cars[index].price}\$/day",
              image: cars[index].image,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width:10,
          ),
          itemCount: cars.length,
        )
    );
  }
}
