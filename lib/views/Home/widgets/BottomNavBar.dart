import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.08,
        child:BottomNavigationBar(
            backgroundColor: backgroundColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels:true,
            unselectedItemColor:Colors.black,
            selectedItemColor:btnPrimary,
            showUnselectedLabels:false,
            currentIndex: activeIndex,
            onTap: (value) => setState(() {
                  activeIndex = value;
            }),
            items:const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house_alt_fill),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favorites"
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  label: "Profile"
              ),
            ]
        )
    );
  }
}
