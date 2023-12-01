import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thula_rental/main.dart';
import 'package:thula_rental/views/Home/HomeScreen.dart';
import 'package:thula_rental/views/Login/LoginScreen.dart';
import 'package:thula_rental/views/Register/RegisterScreen.dart';
import 'package:thula_rental/views/SplashScreen.dart';
import 'package:thula_rental/views/Welcome/WelcomeScreen.dart';

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify if the MaterialApp is rendered.
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify if the SplashScreen with WelcomeScreen as a child is rendered.
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(WelcomeScreen), findsOneWidget);

    // Verify if other routes are properly registered.
    expect(find.byKey(Key('/login')), findsOneWidget);
    expect(find.byKey(Key('/signUp')), findsOneWidget);
    expect(find.byKey(Key('/home')), findsNothing); // HomeScreen should not be rendered initially.
    expect(find.byKey(Key('/welcome')), findsOneWidget);

    // Trigger navigation to the LoginScreen.
    await tester.tap(find.byKey(Key('/login')));
    await tester.pumpAndSettle(); // Wait for the navigation transition to complete.

    // Verify if the LoginScreen is rendered.
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing); // HomeScreen should not be rendered after login.

    // Trigger navigation to the HomeScreen.
    await tester.tap(find.byKey(Key('/home')));
    await tester.pumpAndSettle(); // Wait for the navigation transition to complete.

    // Verify if the HomeScreen is rendered.
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(LoginScreen), findsNothing); // LoginScreen should not be rendered after navigating to HomeScreen.
  });
}
