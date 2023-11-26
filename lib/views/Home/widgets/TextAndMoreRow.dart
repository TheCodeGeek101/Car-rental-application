import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class TextAndMoreRow extends StatelessWidget {
  TextAndMoreRow({super.key,required this.text});
   final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Text(text,style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
          ),
          Container(
            padding:EdgeInsets.symmetric(
              vertical:8,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: secBackgroundColor,
              borderRadius: BorderRadius.circular(40),

            ),
            child: Row(
                children: [
                  Text("More",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                        color: btnPrimary
                    ),
                  ),
                  SizedBox(width:8),
                  Icon(
                    CupertinoIcons.play_arrow_solid,
                    size:10,
                    color: btnPrimary,
                  )
                ]
            ),

          )
        ]
    );
  }
}
