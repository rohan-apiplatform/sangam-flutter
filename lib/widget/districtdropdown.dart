import 'package:flutter/material.dart';
import '../model/district.dart';

class DistrictDropdownWidget extends StatelessWidget {
  final List<District> districts;
  final void Function(District?) onChanged;

  DistrictDropdownWidget({required this.districts, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<District>(
      items: districts.map((district) {
        return DropdownMenuItem<District>(
          value: district,
          child: Text(
            district.district.ta,
            style: TextStyle(color: Colors.black), // Set text color to light green
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'மாவட்டம்',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),       ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),        ),
      ),
    );
  }
}
