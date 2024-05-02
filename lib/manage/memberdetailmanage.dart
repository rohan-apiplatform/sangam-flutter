import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sangam/model/organization.dart';

class MemberState extends ChangeNotifier {
  late bool _likeToJoinNtk = false;
  late String _orgType = "unorganised";
  late List<Organization> _selectedOrganizations = [];
  late List<int> _selectedOrganizationsId = [];
  late bool _ntkMember = false;
late var _ntkMemberId = '0';
  bool get ntkMember => _ntkMember;
  bool get likeToJoinNtk => _likeToJoinNtk;
    get  ntkMemberId => _ntkMemberId;
  String get orgType => _orgType;
  List<Organization> get selectedOrganizations => _selectedOrganizations;
  List<int> get selectedOrganizationsId => _selectedOrganizationsId;

  void updateNtkMember(bool value) {
    _ntkMember = value;
    notifyListeners();
  }

  void updatelikeToJoinNtk(bool value) {
    _likeToJoinNtk = value;
    notifyListeners();
  }

  void updateorgType(String value) {
    _orgType = value;
    notifyListeners();
  }

  set selectedOrganizationsId(List<int> value) {
    _selectedOrganizationsId = value;
    notifyListeners();
  }
  void updateselectedOrganizations(List<Organization> value,List<int> value1) {
    _selectedOrganizations = value;
    _selectedOrganizationsId = value1;

    print(_selectedOrganizationsId);
    notifyListeners();
  }


  void printValues() {
    print('ntkMember: ${_ntkMember.toString()}');
    print('likeToJoinNtk: ${_likeToJoinNtk.toString()}');
    print('orgType: $_orgType');
    print('selectedOrganizations: $_selectedOrganizations');
  }


}
