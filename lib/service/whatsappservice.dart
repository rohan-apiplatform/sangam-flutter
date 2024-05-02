import 'dart:convert';
import 'package:http/http.dart' as http;

class WhatsAppService {
  static Future<void> sendWhatsAppMessage(String phoneNumber) async {
    final String url = 'https://graph.facebook.com/v18.0/291485557385175/messages';
    final String accessToken = 'BSbh1r3DpYMKE9xgc7OaQezJn4fvIWwit5RqXslj2LNTyUuoAVaGRl5HZbB0XxTwft8zkpLcq7e69jIC '; // Replace with your access token

    final Map<String, dynamic> messageData = {
      'messaging_product': 'whatsapp',
      'to': phoneNumber,
      'type': 'template',
      'template': {
        'name': 'hello_world',
        'language': {'code': 'en_US'}
      }
    };

    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(messageData),
      );

      if (response.statusCode == 200) {
        print('WhatsApp message sent successfully to $phoneNumber');
        // Handle success
      } else {
        print('Failed to send WhatsApp message: ${response.body}');
        // Handle failure
      }
    } catch (e) {
      print('Error sending WhatsApp message: $e');
      // Handle error
    }
  }
}
