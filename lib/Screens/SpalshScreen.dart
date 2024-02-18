import 'dart:async';

import'package:flutter/material.dart';
import 'package:urtripo/Screens/LoginScreen.dart';


class Spalshsreen extends StatefulWidget {
  const Spalshsreen({super.key});

  @override
  State<Spalshsreen> createState() => _SpalshsreenState();
}

class _SpalshsreenState extends State<Spalshsreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 121, 193),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/flight_icon.png'),
            SizedBox(height: 20,),
            Text(
              'Flight Booking',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
