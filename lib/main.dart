import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sangam/screens/onboard%20page.dart';
import 'package:sangam/theme/theme.dart';

import 'manage/memberdetailmanage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MemberState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
          useMaterial3: true,
        ),
        home: const OnboardPage(),
      ),
    );
  }
}