import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Fast2SMS {
  static Future<void> sendOTP(String phoneNumber) async {
    final String apiUrl = 'https://www.fast2sms.com/dev/bulkV2';
    final String apiKey = 'BSbh1r3DpYMKE9xgc7OaQezJn4fvIWwit5RqXslj2LNTyUuoAVaGRl5HZbB0XxTwft8zkpLcq7e69jIC';

    // Generate random OTP (4 digits)
    final Random random = Random();
    final String otp = (1000 + random.nextInt(9000)).toString();

    final Map<String, String> headers = {
      'authorization': apiKey,
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final Map<String, String> body = {
      'variables_values': otp,
      'route': 'otp',
      'numbers': phoneNumber,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['return'] == true) {
          print('OTP sent successfully');
        } else {
          print('Failed to send OTP: ${responseData['message']}');
        }
      } else {
        throw Exception('Failed to send OTP: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to send OTP: $e');
    }
  }


static Future<bool> verifyOTP(String phoneNumber, String otp) async {
    final String apiUrl = 'https://www.fast2sms.com/dev/bulkV2/otp/verify';
    final String apiKey = 'BSbh1r3DpYMKE9xgc7OaQezJn4fvIWwit5RqXslj2LNTyUuoAVaGRl5HZbB0XxTwft8zkpLcq7e69jIC';

    final Map<String, String> headers = {
      'authorization': apiKey,
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final Map<String, String> body = {
      'otp': otp,
      'route': 'otp',
      'numbers': phoneNumber,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['return'] == true) {
          return true; // OTP verification successful
        } else {
          return false; // OTP verification failed
        }
      } else {
        throw Exception('Failed to verify OTP: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to verify OTP: $e');
    }
  }
}

void main() {
  final String phoneNumber = '7092676244';

  Fast2SMS.sendOTP(phoneNumber)
      .then((_) => print('OTP sent successfully'))
      .catchError((error) => print('Failed to send OTP: $error'));

  // Example usage of verifyOTP function
  final String enteredOTP = '1234'; // Get OTP entered by user
  Fast2SMS.verifyOTP(phoneNumber, enteredOTP)
      .then((verified) {
    if (verified) {
      print('OTP verification successful');
    } else {
      print('OTP verification failed');
    }
  })
      .catchError((error) => print('Failed to verify OTP: $error'));
}
