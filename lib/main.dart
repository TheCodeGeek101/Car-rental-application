// import 'package:flutter/foundation.dart'
import 'package:flutter/material.dart';
import 'package:thula_rental/views/Home/HomeScreen.dart';
import 'package:thula_rental/views/Login/LoginScreen.dart';
import 'package:thula_rental/views/Register/RegisterScreen.dart';
import 'package:thula_rental/views/SplashScreen.dart';
import 'package:thula_rental/views/Welcome/WelcomeScreen.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thulawena Motors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(
        child: const WelcomeScreen(),
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signUp': (context) => RegisterUser(),
        '/home': (context) => HomeScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}
