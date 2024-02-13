import 'dart:async';
import 'package:flutter/material.dart';

import '../navigator/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    // Implement your logic to check if the user is already logged in
    // For example, you might use SharedPreferences, Firebase Auth, or any other method
    // Here, I'm using a simple boolean variable for demonstration purposes
    isLoggedIn = /* Your login status check logic */ false;

    // Wait for a few seconds and then navigate based on login status
    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, RouteName.homePage);
      } else {
        Navigator.pushReplacementNamed(context, RouteName.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                'https://cdn.freebiesupply.com/logos/large/2x/windows-store-logo-png-transparent.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20,),
            const Text("SUPER",style: TextStyle(color: Colors.blue,fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
            const Text("STORE",style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
          ],
        ),
      ),
    );
  }
}
