import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sangam/screens/step3.dart';

import '../manage/memberdetailmanage.dart';
import '../service/ntkmembernovalidation.dart';

class NtkMemberNo extends StatefulWidget {
  const NtkMemberNo({Key? key}) : super(key: key);

  @override
  State<NtkMemberNo> createState() => _NtkMemberNoState();
}

class _NtkMemberNoState extends State<NtkMemberNo> {
  late TextEditingController _numberController = TextEditingController();
  bool _isLoading = false;
  String? _errorText;

  Future<void> _validateNumber(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    final String number = _numberController.text.trim();

    if (number.isEmpty) {
      setState(() {
        _errorText = 'சரியான உறுப்பினர்  எண்ணைப் பதிவிடவும் ';
      });
      return;
    }

    try {
      final bool isValid = await NumberValidationService.validateNumber(number);

      if (isValid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Step3()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('சரியான உறுப்பினர் எண்ணைப் பதிவிடவும்'),
          ),
        );
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('சரியான உறுப்பினர்  எண்ணைப் பதிவிடவும்'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "உங்கள் உறுப்பினர்  எண்ணைப் பதிவிடவும் ",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.green, fontWeight: FontWeight.w700,),
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            controller: _numberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'நா.த.க உறுப்பினர் எண்',
              errorText: _errorText,
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _isLoading ? null : () {
              _numberController = memberState.ntkMemberId ?? '0';

_numberController;
              _validateNumber(context);
            },
            child: _isLoading ? CircularProgressIndicator() : Text('முன் செல் '),
          ),
        ],
      ),
    );
  }
}
