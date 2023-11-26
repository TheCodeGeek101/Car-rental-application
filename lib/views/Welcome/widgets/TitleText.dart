import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class TitleText extends StatelessWidget {
  TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
        text: TextSpan(
            text: "Turn Moments into Memories with",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(
              color: Colors.white,
              letterSpacing:1.8,
              fontWeight: FontWeight.bold,
            ),
            children:
            const [
              TextSpan(
                  text:"Thulawena Motors",
                  style: TextStyle(color: btnPrimary)
              )
            ]

        )
    );
  }
}
