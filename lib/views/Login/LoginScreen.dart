// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:thula_rental/views/Home/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thula_rental/views/Login/widgets/FormFields.dart';
import 'package:thula_rental/views/widgets/_buildStaticMapImage.dart';
import '../../Helpers/GetCarsHelper.dart';
import '../../Helpers/GetDealersHelper.dart';
import '../../services/BackendApi.dart';
// import '../../services/firebaseAuthServices.dart';
import '../../utils/colors.dart';
import '../../utils/toast.dart';
import '../Register/RegisterScreen.dart';
import '../Register/widgets/FormContainerWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSigning = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
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
                height: 5,
              ),
              const Text(
                "Welcome to Thulawena Motors",
                style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "log into your account",
                style: TextStyle(fontSize: 17,color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 20,
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
                onTap: () {

                  _signIn();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: btnPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Center(
                        child: _isSigning ? const CircularProgressIndicator(
                          color: Colors.white,) : const Text(
                          "sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Icon(Icons.login,color: Colors.white),
                    ]
                  )
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",style: TextStyle(color:Colors.white)),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterUser()),
                            (route) => false,
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: btnPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
  void _signIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;


    var data = {
      'email': email,
      'password': password,
    };
    var res = await CallApi().postData(data, 'auth');
    var body = json.decode(res.body);

    // if response is successiful
    if (res.statusCode == 200) {
      setState(() {
        _isSigning = false;
      });

      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomeScreen()));
      showToast(message: "User is successfully signed in");
      print("user id is:" + body['user']['id']);
      await localStorage.setString('id', body['user']['id']);
      await localStorage.setString('user_name', body['user']['name']);
      await localStorage.setString('email', body['user']['email']);
      await localStorage.setString('password',body['user']['password']);
      await localStorage.setString('token',body['accessToken']);
      print(body['user']['id']);
      print(body['user']['email']);

    } else {
      setState(() {
        _isSigning = false;
      });
      showToast(message: body['message']);
    }
  }

  // _signInWithGoogle()async{
  //
  //   final GoogleSignIn _googleSignIn = GoogleSignIn();
  //
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  //
  //     if(googleSignInAccount != null ){
  //       final GoogleSignInAuthentication googleSignInAuthentication = await
  //       googleSignInAccount.authentication;
  //
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken,
  //       );
  //       await _firebaseAuth.signInWithCredential(credential);
  //       Navigator.pushNamed(context, "/home");
  //     }
  //   }catch(e) {
  //     showToast(message: "some error occured $e");
  //   }
  // }

}