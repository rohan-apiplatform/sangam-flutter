import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../manage/memberdetailmanage.dart';
import '../model/district.dart';
import '../model/member.dart';
import '../service/districtservice.dart';
import '../service/memberservice.dart';
import '../widget/districtdropdown.dart'; // Import the DistrictDropdownWidget

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isChecked = false;
  TextEditingController _fatherNameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _whatsappController = TextEditingController();
  late List<District> _districts = []; // Initialize with an empty list
  List<District> _selectedDistricts = [];

  @override
  void initState() {
    super.initState();
    _fetchDistricts();
  }

  void _fetchDistricts() async {
    try {
      final districts = await DistrictService.fetchDistrict();
      setState(() {
        _districts = districts;
      });
    } catch (e) {
      print('Error fetching districts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final memberState = Provider.of<MemberState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "சங்கம்",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'முதல் பெயர்',
                  labelStyle: TextStyle(fontFamily: 'TamilFont'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: _fatherNameController,
                decoration: InputDecoration(
                  labelText: 'தந்தை/கணவர் பெயர்',
                  labelStyle: TextStyle(fontFamily: 'TamilFont'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'மின்னஞ்சல்',
                  hintText: 'example@gmail.com',
                  labelStyle: TextStyle(fontFamily: 'TamilFont'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'அலைபேசி எண்',
                  labelStyle: TextStyle(fontFamily: 'TamilFont'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                        if (_isChecked) {
                          _whatsappController.text = _phoneController.text;
                        } else {
                          _whatsappController.clear();
                        }
                      });
                    },
                  ),
                  Text(
                    'இதுவே எண் பகிரி எண்',
                    style: TextStyle(fontFamily: 'TamilFont'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: _whatsappController,
                decoration: InputDecoration(
                  labelText: 'பகிரி எண்',
                  labelStyle: TextStyle(fontFamily: 'TamilFont'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 10),
              DistrictDropdownWidget(
                districts: _districts, // Pass the list of districts
                onChanged: (selectedDistrict) {
                  setState(() {
                    _selectedDistricts.clear(); // Clear previous selections
                    if (selectedDistrict != null) {
                      _selectedDistricts.add(selectedDistrict); // Add the selected district
                    }
                    _districtController.text = selectedDistrict?.district.ta ?? '';
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: _postCodeController,
                decoration: InputDecoration(
                  labelText: 'அஞ்சல் எண்',
                  labelStyle: TextStyle(fontFamily: 'TamilFont'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                  elevation: MaterialStateProperty.all<double>(0),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 40),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                onPressed: () {
                  final Member member = Member(
                    name: _firstNameController.text,
                    phone: _phoneController.text,
                    district: _districtController.text,
                    pincode: _postCodeController.text,
                      pincodes: [_postCodeController.text],
                    likeToJoinNtkOrg: memberState.likeToJoinNtk,
                    askNtkMumber: memberState.ntkMember,
                    likeToJoinNtk: memberState.likeToJoinNtk,
                    orgType: memberState.orgType,
                    ntkMemberId: memberState.ntkMemberId,
                    notificationToken: '',
                    orgDetails:memberState.selectedOrganizationsId,
                    isAuthorized: false,
                    createdAt: DateTime.now().millisecondsSinceEpoch,
                    updatedAt: DateTime.now().millisecondsSinceEpoch,
                    isActive: _isChecked,
                    state: 'tamilnadu',
                    country: 'india',
                    email: _emailController.text,
                    gender: 'male'
                  );
                  print("member details,$member");

                  MemberService.createMember(member)
                      .then((_) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('உறுப்பினர் வெற்றிகரமாக உருவாக்கப்பட்டார்!'),
                    ),
                  ))
                      .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('உறுப்பினர் உருவாக்க முடியவில்லை: $error'),
                    ),
                  ));
                },
                child: Text(
                  "முன் செல்",
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
