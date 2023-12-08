import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Dealers.dart';
import '../models/SanityImageSource.dart';
import '../services/BackendApi.dart';
import '../utils/toast.dart';

class GetDealersHelper{

  Future<List> getCarDealers() async {

    try {
      // get car dealers data from sanity.io
      var res = await CallApi().getData('dealers');
      var body = json.decode(res.body);

      // if response is successful
      if (res.statusCode == 200) {
        // showToast(message: "Data retrieved");

        List<Dealer> dealersList = [];

        //  store the car dealers from the Api call in a list
        for (var dealer in body['dealers']) {
          Dealer newDealer = Dealer(
              dealer['name'],
              dealer['offers'],
              dealer['id'],
              SanityImageSource(dealer['image'])
          );
          dealersList.add(newDealer);
        }

        // Save the updated list of car dealers to shared preferences
        await saveCarListToSharedPreferences(dealersList);
        return dealersList;
      } else {
        showToast(message: "Failed to fetch data from API with a status code of" + res.statusCode);
        return [];
      }
    } catch (error) {
      showToast(message: "Error encountered: " + error.toString());
      print("Error encoutered is:" + error.toString());
      return [];
    }

}
// Function to get the list of cars from shared preferences
  Future<List<Dealer>> getCarListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dealersData = prefs.getString('dealers');

    if (dealersData != null) {
      // Directly decode the JSON data into a List<Car>
      List<Dealer> dealersList = (json.decode(dealersData) as List)
          .map((item) => Dealer.fromJsonApi(item))
          .toList();
      return dealersList;
    } else {
      return [];
    }
  }


  // Function to save the list of car dealers to shared preferences
  Future<void> saveCarListToSharedPreferences(List<Dealer> dealers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert the list of car dealers to a JSON representation and store it
    String dealersData = json.encode(dealers.map((dealer) => dealer.toJson()).toList());
    prefs.setString('dealers', dealersData);
  }
}