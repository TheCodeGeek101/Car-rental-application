import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helpers/GetCarReservationsHelper.dart';
import '../../models/Reservation.dart';
import '../../utils/colors.dart';

class CarReservations extends StatefulWidget {
  CarReservations({Key? key});

  @override
  _CarReservationsState createState() {
    return _CarReservationsState();
  }
}

class _CarReservationsState extends State<CarReservations> {
  List<Reservation> reservations = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getString('user_id');

    try {
      // Use await to wait for the completion of getReservationsFromApi
      List<Reservation> apiReservations = await GetCarReservationsHelper().getReservationsFromApi(user_id);

      // Save the reservations to shared preferences
      await GetCarReservationsHelper().saveReservationListToSharedPreferences(apiReservations);

      // Retrieve the updated list of reservations from shared preferences
      var reservationsList = await GetCarReservationsHelper().getReservationListFromSharedPreferences();

      setState(() {
        reservations = reservationsList;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching reservations: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Reservations"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(btnPrimary)));
    } else if (reservations.isEmpty) {
      return Center(child: Text("No reservations available"));
    } else {
      return ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          return getCard(reservations[index]);
        },
      );
    }
  }

  Widget getCard(Reservation reservation) {
    var fullName = reservation.customerId;  // Adjust as per your Reservation model
    var email = reservation.startTime.toString();  // Adjust as per your Reservation model
    var profileUrl = "";  // Add the actual property to get the profile URL

    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: btnPrimary,
                  borderRadius: BorderRadius.circular(60 / 2),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(profileUrl),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    child: Text(fullName, style: TextStyle(fontSize: 17)),
                  ),
                  SizedBox(height: 10,),
                  Text(email, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
