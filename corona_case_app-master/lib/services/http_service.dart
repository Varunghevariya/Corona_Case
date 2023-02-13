import 'dart:convert';

import 'package:corona_case_app/model/summary_modal.dart';
import 'package:corona_case_app/utils/Api_utils.dart';
import 'package:http/http.dart';

import '../model/country_modal.dart';
import '../model/state_modal.dart';

class HttpService
{
  Future<List<Global>> getSummaryDataResponse() async {
    Response res = await get(Uri.parse(BaseUrl.baseurlSummary));
    if(res.statusCode == 200)
      {
        UserSummary users = UserSummary.fromJson(jsonDecode(res.body));
        List<Global> data = [];
        data.addAll([users.global!]);
        //print(data);
        return data;
      }
    else
      {
        throw "This Code Is Error";
      }
  }

  Future getCountryDataResponse() async {
    Response response = await get(Uri.parse(BaseUrl.baseurlCountry));
    if(response.statusCode == 200)
    {

      List<dynamic> dataUserCountry = jsonDecode(response.body);
      return dataUserCountry.map((e){
        return DataCountry.fromJson(e);
      }).toList();
    }
  }

  Future getStateDataResponse() async {
    Response resp = await get(Uri.parse("https://api.covid19api.com/live/country/${BaseUrl.country}/status/status"));
    if(resp.statusCode == 200)
    {

      List<dynamic> dataUserState = jsonDecode(resp.body);
      return dataUserState.map((e){
        return DataState.fromJson(e);
      }).toList();
    }
  }


}
