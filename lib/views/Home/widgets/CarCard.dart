import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CarCard extends StatelessWidget {
  CarCard({super.key,required this.width, required this.height, required this.title, required this.subTitle,required this.image});
    final double width;
    final double height;
    final String title;
    final String subTitle;
    final String image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          padding: EdgeInsets.only(
            left:12,
            right: 12,
            bottom:12,
          ),
          decoration: BoxDecoration(
            color: secBackgroundColor,
            borderRadius: BorderRadius.circular(20),

          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SizedBox(
                    height: height * 0.01,),
                Text(
                    title,
                    style:
                    Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                        color: Colors.white,
                        letterSpacing:0.8
                    )
                ),
                Text(
                    subTitle,
                    style:
                    Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                        color: btnPrimary,
                        letterSpacing:0.8
                    )
                ),
              ]
          )
      ),
        Positioned(
          top: height * 0.5,
          right: (width * 0.2),
          child: SizedBox(
            width: width * 0.8,
            child: Image.asset(
                image,fit: BoxFit.fitHeight
            ),
          ),
        )
    ]
    );
  }
}
