import 'package:flutter/material.dart';
import 'TitleText.dart';

class CarDescription extends StatelessWidget {
  CarDescription({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  SizedBox(
        width:size.width * 0.7,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              TitleText(),
              const SizedBox(height: 32),
              Text("Experience the Thrill of the road with our rentals",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    color: Colors.white,
                    letterSpacing: 1.2,
                    height: 1.3),
              )
            ]
        )
    );
  }
}
