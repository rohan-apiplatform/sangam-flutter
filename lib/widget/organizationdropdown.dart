import 'package:flutter/material.dart';
import '../model/organization.dart';

class DropdownWidget extends StatelessWidget {
  final List<Organization> organizations;
  final void Function(Organization?) onChanged;

  DropdownWidget({required this.organizations, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<Organization>(
        items: organizations.map((org) {
          return DropdownMenuItem<Organization>(
            value: org,
            child: Text(org.tamilName),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: 'சங்கத்தைத் தேர்வு செய்யவும் ',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
