import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
class SearchField extends StatelessWidget {
  SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return                   Row(
        children:[
          Expanded(
            child: SizedBox(
                height: size.width * 0.12,
                child: TextField(
                  cursorColor: backgroundColor,
                  decoration: InputDecoration(
                      prefix: const Icon(
                          CupertinoIcons.search,
                          color: backgroundColor,
                          size: 30
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width:2, color: backgroundColor
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width:2, color: backgroundColor
                          )
                      ),
                      labelStyle: const TextStyle(color: backgroundColor),
                      labelText: "search your dream car",
                      filled:true,
                      fillColor: Colors.white
                  ),
                )
            ),
          ),
          SizedBox(
            width:16,

          ),
          Container(
            width: size.width * 0.12,
            height: size.width * 0.12,
            decoration: BoxDecoration(
                color: btnPrimary,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
                "assets/images/settings.png",
                color: Colors.black
            ),
          ),
        ]
    );

  }
}
