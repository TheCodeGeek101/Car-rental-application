import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class NavAppBar extends StatelessWidget {
  const NavAppBar({super.key});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }
              , icon: const Icon(Icons.menu, color: btnPrimary),
              tooltip: MaterialLocalizations
                  .of(context)
                  .openAppDrawerTooltip,
            );
          },
        ),
        title: const Text("Home",style: TextStyle(color: Colors.white,)),
        backgroundColor: backgroundColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert,color: btnPrimary),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          )
        ]
    );
  }
}
