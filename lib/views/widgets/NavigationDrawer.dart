import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../Login/LoginScreen.dart';
import '../Profile/Profile.dart';
import '../Settings/Settings.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  String _name="";
  String _email="";
  String _logo = "default";

  // void client() async {
  //   // SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var name = localStorage.getString('user_name');
  //   var email = localStorage.getString('email');
  //   var logo = localStorage.getString('logo');
  //   setState(() {
  //     _name = name!;
  //     _email = email!;
  //     _logo = logo!;
  //
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // client();
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
      runSpacing: 16,
      children: [
        // ListTile(
        //   leading: const Icon(Icons.contacts),
        //   title: const Text("Close Contact"),
        //   onTap: (){
        //     //close navigation drawer
        //     Navigator.pop(context);
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Contact(),
        //     ));
        //   },
        // ),
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
