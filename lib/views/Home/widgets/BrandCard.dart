import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class BrandCard extends StatelessWidget {
  BrandCard({super.key, required this.image,required this.width});
    final String image;
    final double width;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Container(
      width: width,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: secBackgroundColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Image.asset(
          image,
          fit: BoxFit.contain),
    );
  }
}
