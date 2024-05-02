import 'dart:convert';
import 'package:http/http.dart' as http;

class NumberValidationService {
  static Future<bool> validateNumber(String number) async {
    final String apiUrl = 'https://join.naamtamilar.org/api/validate/member/$number';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('சரியான உறுப்பினர்  எண்ணைப் பதிவிடவும்');
      }
    } catch (error) {
      print(error);
      throw Exception('சரியான உறுப்பினர் எண்ணைப் பதிவிடவும்.');
    }
  }
}
