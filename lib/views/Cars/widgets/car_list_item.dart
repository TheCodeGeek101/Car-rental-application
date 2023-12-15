import 'package:flutter/material.dart';
import '../../../models/Car.dart';
import '../CarPickupLocation.dart';
import 'car_information.dart';
import '../../../helpers/GetCarsHelper.dart';

class CarListItem extends StatelessWidget {
  const CarListItem(
      this.index, {
        super.key,
      });

  final int index;

  @override
  Widget build(BuildContext context) {
    // Fetch the list of cars from the API using GetCarsHelper
    return FutureBuilder<List<Car>>(
      future: GetCarsHelper().getCarsFromApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // If still loading, you can show a loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If there's an error, you can display an error message
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // If there's no data, you can handle it accordingly
          return Text('No cars available.');
        } else {
          // Data has been loaded successfully
          Car car = snapshot.data![index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CarPickupLocation(car: car);
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Stack(
                children: [
                  CarInfomation(car: car), // Assuming you have a CarInformation widget
                  Positioned(
                    right: 40,
                    child: Image.network(
                      car.images.isNotEmpty ? car.images[0].getImageUrl() : '',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
