import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sangam/model/member.dart';

class MemberService {
  static Future<void> createMember(Member member) async {
    final String apiUrl = 'https://dev-sangam.gateway.apiplatform.io/v1/members';
    final Map<String, String> headers = {
      'apikey': '0tF4kEqjlaKiGeZfN1vOSoSMtwHRqdNH',
      'pkey': '3fe5847e511aafce3fe2d16bbd581823',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(member.toMap()),
      );

      if (response.statusCode == 200 || response.statusCode == 201){
        print('Member created successfully');
      } else {
        throw Exception('Failed to create member');
      }
    } catch (e) {
      throw Exception('Failed to create member: $e');
    }
  }
}
