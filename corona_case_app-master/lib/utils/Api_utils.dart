import 'package:flutter/cupertino.dart';

class BaseUrl
{
  static String baseurlSummary = "https://api.covid19api.com/summary";
  static String baseurlCountry = "https://disease.sh/v3/covid-19/countries";
  static TextEditingController countryText = TextEditingController();
  static TextEditingController stateText = TextEditingController();
  static String country = "";
}