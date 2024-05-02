import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sangam/screens/step3.dart';
import '../service/otpservice.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController phoneNumberController;

  OTPScreen(this.phoneNumberController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ஒருமுறை கடவுச்சொல்',
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      body: OTPForm(phoneNumberController),
    );
  }
}

class OTPForm extends StatefulWidget {
  final TextEditingController phoneNumberController;

  OTPForm(this.phoneNumberController);

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OtpTextField(
              numberOfFields: 4,
              borderColor: Colors.green,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                // Code to handle when OTP is typed
              },
              onSubmit: (String verificationCode) async {
                // Verify OTP here
                try {
                  final bool isVerified = await Fast2SMS.verifyOTP(widget.phoneNumberController.text, verificationCode);
                  if (isVerified) {
                    print('OTP verified successfully');
                    // Navigate to Step3 page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Step3()),
                    );
                  } else {
                    print('OTP verification failed');
                    // Handle OTP verification failure
                  }
                } catch (e) {
                  print('Failed to verify OTP: $e');
                  // Handle OTP verification failure
                }
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Call the function to resend OTP
                Fast2SMS.sendOTP(widget.phoneNumberController.text);
              },
              child: Text('send OTP'),
            ),
          ],
        ),
      ),
    );
  }

  // void sendOTP(String phoneNumber) async {
  //   try {
  //
  //     await Fast2SMS.sendOTP(phoneNumber);
  //     print(Fast2SMS.sendOTP(phoneNumber));
  //     print('OTP sent successfully');
  //   } catch (e) {
  //     print('Failed to send OTP: $e');
  //   }
  // }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
