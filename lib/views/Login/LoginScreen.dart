import 'package:flutter/material.dart';
import 'package:thula_rental/views/Login/widgets/FormFields.dart';
import 'package:thula_rental/views/Login/widgets/_buildStaticMapImage.dart';
import '../../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget> [
          SizedBox(height: 20,),

          SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 50.0,),

                SizedBox(height: 100.0,),
                BuildStaticMapImage(),
                // Image.asset('assets/images/logo.png',height: 120.0,),
                SizedBox(height: 8.0,),
                Text(
                  "Welcome to Thulawena Motors",
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 20.0,fontFamily: "Brand Bold",color: Colors.white,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2.0,),
                Text(
                  "log into your account",
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 13.0,fontFamily: "Brand Bold",color: Colors.grey.shade500,),
                ),
              FormFields(),
              ],
            ),
          ),
          // Positioned(
          //   top: 30,
          //   right: 30,
          //   child: IconButton(
          //       color: Colors.lightBlue,
          //       alignment: AlignmentDirectional.topStart,
          //       onPressed: ()
          //       {
          //         openDialog();
          //         // print("hello");
          //       },
          //       icon: Icon(Icons.settings,size: 60,)),
          // ),
        ],
      ),
    );
  }
}