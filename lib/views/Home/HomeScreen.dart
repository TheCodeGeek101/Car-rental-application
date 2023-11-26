import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thula_rental/views/Home/widgets/BottomNavBar.dart';
import 'package:thula_rental/views/Home/widgets/BrandCard.dart';
import 'package:thula_rental/views/Home/widgets/CarCard.dart';
import 'package:thula_rental/views/Home/widgets/NavAppBar.dart';
import 'package:thula_rental/views/Home/widgets/ScrollableCars.dart';
import 'package:thula_rental/views/Home/widgets/TextAndMoreRow.dart';
import 'package:thula_rental/views/Home/widgets/scrollableBrands.dart';
import '../../models/Car.dart';
import '../../utils/colors.dart';
import 'package:thula_rental/views/widgets/NavigationDrawer.dart';
import 'widgets/TopAppBar.dart';
import 'widgets/SearchField.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
        drawer: const NavDrawer(),
        body: body(context),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }

  Widget body(BuildContext context) {
      var size = MediaQuery.of(context).size;
      return Column(
          children:[
            Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                    height: size.height * 0.25,
                    child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          TopAppBar(),
                          Text("Search Your Dream \n Super Car to drive",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: secBackgroundColor,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                          SearchField(),
                        ]
                    )
                )
            ),
            const SizedBox(height: 16),
            Expanded(
                flex:2,
                child:Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30)
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          TextAndMoreRow(text: 'Top Brands',),
                          ScrollableBrands(),
                          TextAndMoreRow(text: 'Recommendations',),
                          SizedBox(
                            height: 12,
                          ),
                          ScrollableCars(),
                        ]
                    )
                )
            )
          ]
      );
  }

}