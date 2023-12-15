import 'package:flutter/material.dart';

import '../../models/Car.dart';
import '../../utils/colors.dart';
import '../widgets/NavigationDrawer.dart';
import 'Widgets/PaymentMethods.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key,required this.car, required this.data});
  final Car car;
  final Object data;
  @override
  _PaymentScreenState createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: btnPrimary),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert, color: btnPrimary),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          )
        ],
      ),
      // drawer: const NavDrawer(),
      body:SafeArea(
         child: Padding(
            padding:EdgeInsets.all(20),
           child: Center(
             child: PaymentMethods(car:widget.car,data:widget.data),
           )
         ),
      )
    );
  }
}