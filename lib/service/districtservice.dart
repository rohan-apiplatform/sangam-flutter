import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/district.dart';

class DistrictService {
  static Future<List<District>> fetchDistrict() async {
    final String apiUrl = 'https://dev-sangam.gateway.apiplatform.io/v1/district?stateId=30';

    final Map<String, String> headers = {
      'apikey': '0tF4kEqjlaKiGeZfN1vOSoSMtwHRqdNH',
      'pkey': '3fe5847e511aafce3fe2d16bbd581823',
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<District> districts = data.map((e) => District.fromJson(e)).toList();
      return districts;
    } else {
      throw Exception('Failed to load districts');
    }
  }
}
