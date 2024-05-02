import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sangam/screens/detailspage.dart';

import '../manage/memberdetailmanage.dart';
import '../model/organization.dart';
import '../widget/organizationdropdown.dart';
import '../service/organizationservice.dart';
import 'newsangam.dart';

class Step4UnOrg extends StatefulWidget {
  const Step4UnOrg({Key? key}) : super(key: key);

  @override
  State<Step4UnOrg> createState() => _Step4UnOrgState();
}

class _Step4UnOrgState extends State<Step4UnOrg> {
  late List<Organization> _organizations = [];
  List<Organization> _selectedOrganizations = [];
  List<int> _selectedOrganizationsId = [];

  @override
  void initState() {
    super.initState();
    _fetchOrganizations('unorganized');
  }

  void _fetchOrganizations(String type) async {
    try {
      final organizations = await OrganizationService.fetchOrganizations(type);
      setState(() {
        _organizations = organizations;
      });
    } catch (e) {
      print('Error fetching organizations: $e');
    }
  }



  void _onOrganizationSelected(Organization selectedOrg) {
    setState(() {
      _selectedOrganizations.add(selectedOrg);
      _selectedOrganizationsId.add(selectedOrg.id);
    });
  }

  void _removeOrganization(Organization orgToRemove) {
    setState(() {
      _selectedOrganizations.remove(orgToRemove);
      int indexToRemove = _selectedOrganizations.indexOf(orgToRemove);
      _selectedOrganizationsId.removeAt(indexToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    final memberState = Provider.of<MemberState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "சங்கம் ",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "படி- 4",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.green),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Set button color to green
                  elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 40), // Set button width to fit the screen size
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0), // Set border radius to 0 for square edges
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Newsangam()),
                  );
                },
                child: Text(
                  "புதிய சங்கத்தைப் பதிவிடவும் ",
                  style: TextStyle(color: Colors.white, fontSize: 20), // Set text color to white
                ),
              ),
            ),
            Text(
              "(அல்லது) ",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              "தங்கள் சங்கத்தைத் தேர்ந்தெடுக்கவும் ",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            DropdownWidget(
              organizations: _organizations,
              onChanged: (selectedOrg) {
                _onOrganizationSelected(selectedOrg!);

              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedOrganizations.length,
                itemBuilder: (context, index) {
                  final org = _selectedOrganizations[index];
                  _selectedOrganizationsId[index]=org.id;

                  return ListTile(
                    title: Text(org.tamilName),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _removeOrganization(org);

                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen), // Set button color to green
                  elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 40), // Set button width to fit the screen size
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0), // Set border radius to 0 for square edges
                    ),
                  ),
                ),
                onPressed: () {
                  _selectedOrganizations=memberState.selectedOrganizations;

                  memberState.selectedOrganizationsId = List.from(_selectedOrganizationsId);

                  print("_selectedOrganizationsId,${_selectedOrganizationsId}");
                  _selectedOrganizations;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage()),
                  );
                },
                child: Text(
                  "முன் செல்",
                  style: TextStyle(color: Colors.white, fontSize: 20), // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
