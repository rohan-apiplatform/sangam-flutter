import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/organization.dart';

class OrganizationService {
  static Future<List<Organization>> fetchOrganizations(String type) async {
    final String apiUrl = 'https://dev-sangam.gateway.apiplatform.io/v1/organizations';
    final Map<String, String> headers = {
      'apikey': '0tF4kEqjlaKiGeZfN1vOSoSMtwHRqdNH',
      'pkey': '3fe5847e511aafce3fe2d16bbd581823',
    };

    final response = await http.get(Uri.parse('$apiUrl?type=$type'), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Organization> organizations = data.map((e) => Organization.fromJson(e)).toList();
      return organizations;
    } else {
      throw Exception('Failed to load organizations');
    }
  }

  static Future<int> fetchOrganizationId(String name) async {
    final String apiUrl = 'https://dev-sangam.gateway.apiplatform.io/v1/organizations';
    final Map<String, String> headers = {
      'apikey': '0tF4kEqjlaKiGeZfN1vOSoSMtwHRqdNH',
      'pkey': '3fe5847e511aafce3fe2d16bbd581823',
    };

    final response = await http.get(Uri.parse('$apiUrl?name=$name'), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        // Assuming the API returns a list of organizations with unique names
        return data[0]['id']; // Assuming 'id' is the key for the organization ID
      } else {
        throw Exception('Organization not found');
      }
    } else {
      throw Exception('Failed to load organization');
    }
  }
}

