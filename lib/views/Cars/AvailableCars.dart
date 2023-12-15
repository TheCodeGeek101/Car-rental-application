import 'package:flutter/material.dart';
import 'package:thula_rental/views/Cars/widgets/car_list_item.dart';
import '../../models/Car.dart';
import '../../utils/colors.dart';
import '../widgets/NavigationDrawer.dart';
import '../../../helpers/GetCarsHelper.dart'; // Import the GetCarsHelper

class AvailableCarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: btnPrimary),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          "Available Cars",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: secBackgroundColor,
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
      body: FutureBuilder<List<Car>>(
        future: GetCarsHelper().getCarsFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If still loading, you can show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error, you can display an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If there's no data, you can handle it accordingly
            return Center(child: Text('No cars available.'));
          } else {
            // Data has been loaded successfully
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => CarListItem(index),
            );
          }
        },
      ),
    );
  }
}
