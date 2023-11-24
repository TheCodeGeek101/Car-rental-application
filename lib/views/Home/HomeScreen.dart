import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'package:thula_rental/views/widgets/NavigationDrawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        ),
        drawer: NavDrawer(),
        body: Column(
          children:[
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children:[
                  Row(
                    children:[
                      Icon(
                          Icons.location_on,
                          color: btnPrimary,
                          size: 30,
                      ),
                      SizedBox(width:8),
                      Column(
                        children:[
                          Text(
                            "Your Location",
                            style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: secBackgorundColor
                            ),
                          )
                        ]
                      )
                    ]
                  )
                ]
              )
            )
          ]
        )
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}