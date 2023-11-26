import 'package:flutter/material.dart';
import 'package:thula_rental/views/Welcome/widgets/BackgroundImage.dart';
import 'package:thula_rental/views/Welcome/widgets/CarDescription.dart';
import 'package:thula_rental/views/Home/HomeScreen.dart';
import 'package:thula_rental/views/Register/RegisterScreen.dart';
import '../../utils/colors.dart';
import '../Login/LoginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Column(
            children: [
              BackgroundImage(),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: backgroundColor,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30),
                        ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                            SizedBox(height: size.height * 0.15),
                            CarDescription(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(size.width, size.height * 0.08),
                                backgroundColor: btnPrimary,
                                shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterUser()));
                              },
                              child: Text("Get started",style:
                                Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: backgroundColor
                                )
                              ),
                            )
                          ]
                        )
                      ),
                      Positioned(
                        top: -size.height * 0.5 * 0.7,
                        left: -size.height * 0.5 * 0.10,
                        child: SizedBox(
                          height: size.height * 0.5,
                          child: Image.asset("assets/images/aa.png",fit: BoxFit.fitHeight)
                        ),
                      ),
                    ],

                ),
              )
            ]
        )
    );
  }
}

