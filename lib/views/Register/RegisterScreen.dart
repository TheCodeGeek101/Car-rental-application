import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thula_rental/views/Register/widgets/FormContainerWidget.dart';
import 'package:thula_rental/views/Register/widgets/FormFields.dart';

import '../../services/BackendApi.dart';
// import '../../services/firebaseAuthServices.dart';
import '../../utils/colors.dart';
import '../../utils/toast.dart';
import '../Home/HomeScreen.dart';
import '../Login/LoginScreen.dart';
import 'package:thula_rental/views/widgets/_buildStaticMapImage.dart';

class RegisterUser extends StatefulWidget {
  RegisterUser({super.key});

  @override
  _RegisterUserState createState() {
    return _RegisterUserState();
  }
}

class _RegisterUserState extends State<RegisterUser> {
  // final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildStaticMapImage(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign Up to get started",
                style: TextStyle(fontSize: 20,color:Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                validator:(value) {
                  if (value == null || value.isEmpty) {
                    showToast(message: 'Please enter your email');
                    return;
                  }
                  // Use a regular expression to check if the email is valid
                  // Adjust the regex as needed for your specific requirements
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    showToast(message:'Please enter a valid email address');
                    return;
                  }
                  return null;
                },
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap:  (){
                  _signUp();

                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: btnPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:[
                      Center(
                          child: isSigningUp ? const CircularProgressIndicator(color: Colors.white,):const Text(
                            "Create Account",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(width:5),
                      const Icon(Icons.person_add,color:Colors.white),
                    ]
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",style:TextStyle(color:Colors.white),),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                                (route) => false);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: btnPrimary, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    var data = {
      'email': email,
      'password': password,
      'name':username
    };
    var res = await CallApi().postData(data, 'register');
    var body = json.decode(res.body);

    // if response is successifull
    if (res.statusCode == 201) {
      setState(() {
        isSigningUp = false;
      });
      showToast(message: "User  successfully created");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const LoginScreen()));
    } else {
      setState(() {
        isSigningUp = false;
      });
      showToast(message: body['message']);
    }
  }
}