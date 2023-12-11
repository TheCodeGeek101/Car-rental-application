import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Car.dart';
import '../models/SanityImageSource.dart';
import '../services/BackendApi.dart';
import '../utils/toast.dart';

class GetCarsHelper {

  Future<List<Car>> getCarsFromApi() async {
    try {
      var res = await CallApi().getData('cars');
      var body = json.decode(res.body);

      if (res.statusCode == 200) {
        // showToast(message: "Data retrieved");

        List<Car> carsList = [];

        for (var car in body['cars']) {
          Car newCar = Car(
              car['brand'],
              car['model'],
              car['price'],
              "ready",
              car['gearbox'],
              car['speed'],
              car['seat'],
              car['topSpeed'],
              car['color'],
              car['motor'],
              car['id'],
              [
                if (car['frontImage'] != null) SanityImageSource(car['frontImage']),
                if (car['rearImage'] != null) SanityImageSource(car['rearImage']),
                if (car['sideImage'] != null) SanityImageSource(car['sideImage']),
                if (car['upperImage'] != null) SanityImageSource(car['upperImage']),
              ]
          );
          carsList.add(newCar);
        }

        // Save the updated list of cars to shared preferences
        await saveCarListToSharedPreferences(carsList);
        return carsList;
      } else {
        showToast(message: "Failed to fetch data from API");
        return [];
      }
    } catch (error) {
      showToast(message: "Error encountered: " + error.toString());
      print(error.toString());
      return [];
    }
  }

  // Function to get the list of cars from shared preferences
  Future<List<Car>> getCarListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? carsData = prefs.getString('cars');

    if (carsData != null) {
      // Directly decode the JSON data into a List<Car>
      List<Car> carsList = (json.decode(carsData) as List)
          .map((item) => Car.fromJsonApi(item))
          .toList();
      return carsList;
    } else {
      return [];
    }
  }


  // Function to save the list of cars to shared preferences
  Future<void> saveCarListToSharedPreferences(List<Car> cars) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert the list of cars to a JSON representation and store it
    String carsData = json.encode(cars.map((car) => car.toJson()).toList());
    await prefs.setString('cars', carsData);
  }
}
