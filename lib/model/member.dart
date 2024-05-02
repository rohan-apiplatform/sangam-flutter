import 'dart:convert';

class Member {

  @override
  String toString() {
    return 'Member{name: $name, phone: $phone, district: $district, pincode: $pincode, pincodes: $pincodes, '
        'likeToJoinNtkOrg: $likeToJoinNtkOrg, askNtkMumber: $askNtkMumber, '
        'likeToJoinNtk: $likeToJoinNtk, orgType: $orgType, ntkMemberId: $ntkMemberId, '
        'notificationToken: $notificationToken, orgDetails: $orgDetails, '
        'isAuthorized: $isAuthorized, createdAt: $createdAt, updatedAt: $updatedAt, '
        'isActive: $isActive, state: $state, country: $country, email: $email, '
        'gender: $gender}';
  }

  final String name;
  final String phone;
  final String district;
  final String pincode;
  final List<String> pincodes;
  final bool likeToJoinNtkOrg;
  final bool askNtkMumber;
  final bool likeToJoinNtk;
  final String orgType;
  final String ntkMemberId;
  final String notificationToken;
  final List<int> orgDetails;
  final bool isAuthorized;
  final int createdAt;
  final int updatedAt;
  final bool isActive;
  final String state;
  final String country;
  final String email;
  final String gender;

  Member({
    required this.name,
    required this.phone,
    required this.district,
    required this.pincode,
    required this.pincodes,
    required this.likeToJoinNtkOrg,
    required this.askNtkMumber,
    required this.likeToJoinNtk,
    required this.orgType,
    required this.ntkMemberId,
    required this.notificationToken,
    required this.orgDetails,
    required this.isAuthorized,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.state,
    required this.country,
    required this.email,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'district': district,
      'pincode': pincode,
      'pincodes': pincodes,
      'likeToJoinNtkOrg': likeToJoinNtkOrg,
      'askNtkMumber': askNtkMumber,
      'likeToJoinNtk': likeToJoinNtk,
      'orgType': orgType,
      'ntkMemberId': ntkMemberId,
      'notificationToken': notificationToken,
      'orgDetails': orgDetails,
      'isAuthorized': isAuthorized,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isActive': isActive,
      'state': state,
      'country': country,
      'email': email,
      'gender': gender,
    };
  }
}
