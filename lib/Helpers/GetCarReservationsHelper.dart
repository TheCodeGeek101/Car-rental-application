import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Reservation.dart';
import '../services/BackendApi.dart';
import '../utils/toast.dart';

class GetCarReservationsHelper {

  // Call the reservation endpoint from the backend Api
  Future<List<Reservation>> getReservationsFromApi(data) async {
    try {
      var res = await CallApi().postData(data,'reservations');
      var body = json.decode(res.body);
      showToast(message: res.body.toString());
      print(res.body);

      if (res.statusCode == 200) {

        List<Reservation> reservationList = [];

        for (var reservation in body['reservations']) {
          Reservation newReservation = Reservation(
              reservation['start_time'],
              reservation['end_time'],
              reservation['customer'],
              reservation['car'],
              reservation['id'],
          );
          reservationList.add(newReservation);
        }

        // Save the updated list of reservations to shared preferences
        await saveReservationListToSharedPreferences(reservationList);
        return reservationList;
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

  // Function to get the list of reservations from shared preferences
  Future<List<Reservation>> getReservationListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? reservationData = prefs.getString('reservations');

    if (reservationData != null) {
      // Directly decode the JSON data into a List<Reservation>
      List<Reservation> dealersList = (json.decode(reservationData) as List)
          .map((item) => Reservation.fromJsonApi(item))
          .toList();
      return dealersList;
    } else {
      return [];
    }
  }

  // Function to save the list of reservations to shared preferences
  Future<void> saveReservationListToSharedPreferences(List<Reservation> reservations) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert the list of reservations to a JSON representation and store it
    String reservationData = json.encode(reservations.map((reservation) => reservation.toJson()).toList());
    await prefs.setString('reservations', reservationData);
  }
}