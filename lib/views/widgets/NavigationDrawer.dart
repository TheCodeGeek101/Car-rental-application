import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../Login/LoginScreen.dart';
import '../Payments/PaymentScreen.dart';
import '../Profile/Profile.dart';
import '../Reservations/CarReservations.dart';
import '../Settings/Settings.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  String _name="";
  String _email="";


  void client() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var name = localStorage.getString('user_name');
    var email = localStorage.getString('email');
    setState(() {
      _name = name!;
      _email = email!;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client();
  }

  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: Colors.white,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Material(
    color: backgroundColor,
    child: InkWell(
      onTap: (){
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Profile(),
        ));
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children:  [
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage("assets/images/thulawenamotors.png"),
            ),
            SizedBox(height: 12,),
            Text(
              _name,
              style: TextStyle(fontSize: 28,color: Colors.white),
            ),
            Text(
              _email,
              style: TextStyle(fontSize:16,color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 9,
      children: [
        ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text('My Reservations'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CarReservations(),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.credit_card),
          title: Text('Payment Methods'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  PaymentScreen()));
            // Handle Payment Methods tap
          },
        ),
        ListTile(
          leading: Icon(Icons.local_offer),
          title: Text('Promotions'),
          onTap: () {
            // Handle Promotions tap
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('History'),
          onTap: () {
            // Handle History tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_sharp),
          title: const Text("Settings"),
          onTap: (){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Settings(),
            ));
          },
        ),
        const Divider(color: Colors.black54,),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  LoginScreen(),
            ));
          },
        ),
      ],
    ),
  );
}
