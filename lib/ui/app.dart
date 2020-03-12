import 'package:covid19_mobile_triage/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class CovidTriageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Covid 19 Triage App'),
    );
  }
}