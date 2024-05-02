import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sangam/screens/step1.dart';

import 'opt.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("தொழிற்சங்கப் பேரவை ",style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),textAlign: TextAlign.center),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(80,24,60,0),
          child: Text("நாம்  தமிழர் கட்சி ",style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.green))),
          Padding(
            padding: EdgeInsets.all(36),
            child: Image.asset("lib/assets/logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Set button color to green
                elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 40)), // Set button width to fit the screen size
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Set border radius to 0 for square edges
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Otp()),
                );
              },
              child: Text(
                "உள்நுழையவும்",
                style: TextStyle(color: Colors.white,fontSize: 20), // Set text color to white
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen), // Set button color to green
                elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 40)), // Set button width to fit the screen size
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Set border radius to 0 for square edges
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Step1()),
                );
              },
              child: Text(
                "கணக்கை உருவாக்கவும் ",
                style: TextStyle(color: Colors.white,fontSize: 20), // Set text color to white
              ),
            ),
          )
        ],
      ),
    );
  }
}
