import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'VerificationScreens/LoginScreen.dart';
import './Screens/HomePage.dart';
import './VerificationScreens/SignUpScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
     home: LoginScreen(),
      routes: {
     SignUpScreen.routeName: (context) => SignUpScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
HomePage.routeName: (context)=> HomePage(),

      },

    );
  }
}
