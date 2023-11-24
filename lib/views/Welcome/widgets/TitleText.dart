import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class TitleText extends StatelessWidget {
  TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
        text: TextSpan(
            text: "Turn Moments into Memories with our",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(
              color: Colors.white,
              letterSpacing:1.2,
              fontWeight: FontWeight.bold,
            ),
            children:
            const [
              TextSpan(
                  text:"Rental Fleet",
                  style: TextStyle(color: btnPrimary)
              )
            ]

        )
    );
  }
}
