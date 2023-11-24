import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return  Container(
        height: size.height * 0.45,
        padding: EdgeInsets.all(16),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("assets/images/audi.jpg"),
        //         fit: BoxFit.cover
        //     )
        // )
    );
  }
}