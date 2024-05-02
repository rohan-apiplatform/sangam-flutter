import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sangam/screens/step2.dart';

import '../manage/memberdetailmanage.dart';
import 'ntkmemberno.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  late bool ntkMember ;
  @override
  Widget build(BuildContext context) {
    final memberState = Provider.of<MemberState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
        AppBar(
          title: Text("சங்கம் ",style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),textAlign: TextAlign.center),
          backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Text("நாம்  தமிழர் கட்சி ",style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.green,fontWeight: FontWeight.w700,),textAlign: TextAlign.center),
          Text("கட்சியின் உறுப்பினரா ? ",style:Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.green),textAlign: TextAlign.center),
          Text("படி -1",style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.green,),textAlign: TextAlign.center),
          Padding(
            padding: EdgeInsets.all(36),
            child: Image.asset("lib/assets/logo.png",width: 200,height: 200,),
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
                setState(() {
                  ntkMember = memberState.ntkMember;
                  ntkMember = true; // Set _ntkMember to false when the second button is pressed
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NtkMemberNo()),
                );
              },
              child: Text(
                "ஆம்",
                style: TextStyle(color: Colors.white, fontSize: 20), // Set text color to white
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen), // Set button color to white
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
                setState(() {
                  ntkMember = memberState.ntkMember;
                  ntkMember = false;
                  print("ntkmember value is: $ntkMember");// Set _ntkMember to false when the second button is pressed
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Step2()),
                );
              },
              child: Text(
                "இல்லை",
                style: TextStyle(color: Colors.white, fontSize: 20), // Set text color to green
              ),
            ),
          ),


        ],
      ),
    );
  }
}
