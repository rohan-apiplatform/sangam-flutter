import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Newsangam extends StatefulWidget {
  const Newsangam({Key? key}) : super(key: key);

  @override
  State<Newsangam> createState() => _NewsangamState();
}

class _NewsangamState extends State<Newsangam> {
  TextEditingController _sangamNameController = TextEditingController();
  TextEditingController _vilakamController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    _sangamNameController.dispose();
    _vilakamController.dispose();
    super.dispose();
  }

  void printStoredValues() {
    final String sangamName = _sangamNameController.text;
    final String vilakam = _vilakamController.text;

    print('சங்கத்தின் பெயர்: $sangamName');
    print('விளக்கம் : $vilakam');

    if (_image != null) {
      print('Image Path: ${_image!.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "புதிய சங்கத்தைப் பதிவிடவும்",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.green,
        actions: [
          // IconButton(
          //   onPressed: printStoredValues,
          //   icon: Icon(Icons.print),
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            TextField(
              controller: _sangamNameController,
              decoration: InputDecoration(
                labelText: 'சங்கத்தின் பெயர்',
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
            TextField(
              controller: _vilakamController,
              decoration: InputDecoration(
                labelText: 'விளக்கம் ',
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
            Text("சங்கத்தின் இலச்சினையை உள்ளிடவும்",),
            SizedBox(height: 10),
            GestureDetector(
              onTap: getImage,
              child: Container(
                width: 300,
                height: 200,
                color: Colors.grey[200],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : Icon(Icons.add_photo_alternate, size: 50, color: Colors.grey),
              ),
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Step4()),
                  // );
                },
                child: Text(
                  "உள்ளிடவும்",
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
