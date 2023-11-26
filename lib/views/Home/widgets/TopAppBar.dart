import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class TopAppBar extends StatelessWidget {
  TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
        children:[
          Icon(
            Icons.location_on,
            color: btnPrimary,
            size: 30,
          ),
          SizedBox(width:2),
          Column(
              children:[
                Text(
                  "Your Location",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(
                      color: secBackgroundColor
                  ),
                ),
                Text(
                  "University of Malawi,Zomba",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(
                      color: secBackgroundColor
                  ),
                )
              ]
          ),
        ]
    );
  }
}
