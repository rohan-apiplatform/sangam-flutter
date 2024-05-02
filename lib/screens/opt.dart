import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sangam/screens/opt2.dart';

import '../manage/memberdetailmanage.dart';
class Otp extends StatefulWidget {
  const Otp({Key? key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final memberState = Provider.of<MemberState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'உள்நுழை பெட்டகம்',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/otp.gif', // Replace 'lib/assets/otp.gif' with the actual file path
                width: 300,
                height: MediaQuery.of(context).size.height * 0.3, // Set height based on screen height
              ),
              SizedBox(height: 20),
              TextField(
                controller:_phoneNumberController,
                decoration: InputDecoration(
                  hintText: 'தொலைபேசி எண் ',
                  labelText: 'தொலைபேசி எண்',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Set button color to green
                  elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 40), // Set button width to fit the screen size
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0), // Set border radius to 0 for square edges
                    ),
                  ),
                ),
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OTPScreen( _phoneNumberController )),
                  );
                },
                child: Text(
                  'உள்நுழையவும்',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
