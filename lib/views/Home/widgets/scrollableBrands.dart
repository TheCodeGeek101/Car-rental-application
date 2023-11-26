import 'package:flutter/material.dart';

import 'BrandCard.dart';

class ScrollableBrands extends StatelessWidget {
  ScrollableBrands({super.key});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var images = [
      "assets/images/benzlogo.jpg",
      "assets/images/bmwlogo.jpg",
      "assets/images/audilogo.jpg",
      "assets/images/audi.jpg",
      "assets/images/benzamg.jpg",
      "assets/images/bmw.jpg"
    ];
    // TODO: implement build
    return SizedBox(
        height: (size.width -    16 * 4)/3,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return BrandCard(image: images[index], width: (size.width - 16 * 4)/3,);
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,

            ),
            itemCount: images.length
        )
    );
  }
}
