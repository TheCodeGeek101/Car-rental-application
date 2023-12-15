import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helpers/BookCarHelper.dart';
import '../../models/Car.dart';
import '../../utils/colors.dart';
import '../Cars/CarPickupLocation.dart';
import '../Payments/PaymentScreen.dart';
import '../widgets/NavigationDrawer.dart';

class BookingDate extends StatefulWidget {
  final Car car;
  BookingDate({ required this.car});

  @override
  _BookingDateState createState() {
    return _BookingDateState();
  }
}

class _BookingDateState extends State<BookingDate> {

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  @override
  void initState(){
    super.initState();
    startDateController.text="";
    endDateController.text="";
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon:  Icon(Icons.menu, color: btnPrimary),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          "Book Car",
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
      drawer: const NavDrawer(),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Column(
                children:[
                  TextField(
                    controller: startDateController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Enter start Date"
                    ),
                    readOnly: true,
                    onTap: () async{
                      DateTime? pickedDate=await showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: btnPrimary, // Set your desired color here
                              colorScheme: ColorScheme.light(primary: btnPrimary),
                              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if(pickedDate!=null){
                        String formattedDate=DateFormat("yyyy-MM-dd").format(pickedDate);

                        setState(() {
                          startDateController.text = formattedDate.toString();
                        });
                      }else{
                        print("Start date Not selected");
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: endDateController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Enter end Date"
                    ),
                    readOnly: true,
                    onTap: () async{
                      DateTime? pickedDate=await showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: btnPrimary, // Set your desired color here
                              colorScheme: ColorScheme.light(primary: btnPrimary),
                              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if(pickedDate!=null){
                        String formattedDate=DateFormat("yyyy-MM-dd").format(pickedDate);

                        setState(() {
                          endDateController.text=formattedDate.toString();
                        });
                      }else{
                        print("End date Not selected");
                      }
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: btnPrimary, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () async {
                      SharedPreferences localStorage = await SharedPreferences.getInstance();
                      var customerId = localStorage.getString('user_id');
                      var data = {
                        "car": widget.car.id,
                        "customer": customerId,
                        "start_time":startDateController.text,
                        "end_time":endDateController.text
                      };

                      if(data != {}){
                        // BookCarHelper().bookCar(data);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  PaymentScreen(car:widget.car,data:data)));

                      }

                    },
                    child: Text('book this car'),
                  )
                ]
              )
          )
      ),
    );
  }
}