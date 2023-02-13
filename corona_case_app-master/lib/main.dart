import 'package:corona_case_app/screen/country_screen.dart';
import 'package:corona_case_app/screen/home_screen.dart';
import 'package:corona_case_app/screen/state_screen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      routes: {
        '/'  : (context) =>  HomePage(),
        'country' : (context)  => CountryData(),
        'state' : (context) => StateScreen()
      },
    ),
  );
}