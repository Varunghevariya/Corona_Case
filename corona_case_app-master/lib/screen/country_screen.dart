import 'package:corona_case_app/model/country_modal.dart';
import 'package:corona_case_app/utils/Api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/http_service.dart';

class CountryData extends StatefulWidget {
  const CountryData({Key? key}) : super(key: key);

  @override
  State<CountryData> createState() => _CountryDataState();
}

class _CountryDataState extends State<CountryData> {
  final countrySearchText = ValueNotifier("");
  HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Country Wise Cases",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),

              // TextFormField

              const SizedBox(height: 20,),
              TextFormField(
                controller: BaseUrl.countryText,
                onChanged: (val){
                  setState(() {
                    countrySearchText.value= val;
                  });
                },
                decoration: InputDecoration(
                  suffix: GestureDetector(
                    onTap: (){
                      setState(() {
                        BaseUrl.countryText.clear();
                      });
                    },
                    child: const Icon(CupertinoIcons.clear_circled_solid,
                    color: Colors.grey,
                    ),
                  ),
                  hintText: "Search Country",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    )
                  ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        )
                    )
                ),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Country Name

              const SizedBox(height: 10,),
              Expanded(
                child: (countrySearchText.value != "") ?
                FutureBuilder(
                  future: httpService.getCountryDataResponse(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData)
                    {
                      List<DataCountry> countryData = snapshot.data!;
                      return ListView.builder(
                        itemCount: countryData.length,
                        itemBuilder: (context,index){
                          return (countryData[index].country!.toUpperCase().contains(countrySearchText.value.toUpperCase())) ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: ExpansionTile(
                                trailing: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        BaseUrl.country = countryData[index].country.toString();
                                        Navigator.pushNamed(context, 'state');
                                      });
                                    },
                                    child: const Icon(CupertinoIcons.info,color: Colors.black,)),
                                leading: SizedBox(height : 30 ,child: Image.network("${countryData[index].countryInfo!.flag}")),
                                tilePadding: const EdgeInsets.symmetric(horizontal: 15),
                                title: Text("${countryData[index].country}", style: GoogleFonts.poppins(color: Colors.black),),
                                expandedAlignment: Alignment.centerLeft,
                                childrenPadding: const EdgeInsets.all(10),
                                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Cases : ${countryData[index].cases}"),
                                  Text("Today Cases : ${countryData[index].todayCases}"),
                                  Text("Active Cases : ${countryData[index].active}"),
                                  Text("Critical Cases : ${countryData[index].critical}"),
                                  Text("Total Death : ${countryData[index].deaths}"),
                                  Text("Total Recovered : ${countryData[index].todayDeaths}"),
                                  Text("Today Recovered: ${countryData[index].todayRecovered}"),
                                  Text("Tests : ${countryData[index].tests}"), Text("continent : ${countryData[index].continent}"),
                                ],
                              ),
                            ),
                          ) : Container();
                        },
                      );
                    }
                    else
                    {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ) :
                FutureBuilder(
                  future: httpService.getCountryDataResponse(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData)
                    {
                      List<DataCountry> countryData = snapshot.data!;
                      return ListView.builder(
                        itemCount: countryData.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: ExpansionTile(
                                trailing: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        BaseUrl.country = countryData[index].country.toString();
                                        Navigator.pushNamed(context, 'state');
                                      });
                                    },
                                    child: const Icon(CupertinoIcons.info,color: Colors.black,)),
                                leading: SizedBox(height : 30 ,child: Image.network("${countryData[index].countryInfo!.flag}")),
                                tilePadding: const EdgeInsets.symmetric(horizontal: 15),
                                title: Text("${countryData[index].country}", style: GoogleFonts.poppins(color: Colors.black),),
                                expandedAlignment: Alignment.centerLeft,
                                childrenPadding: const EdgeInsets.all(10),
                                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Cases : ${countryData[index].cases}"),
                                  Text("Today Cases : ${countryData[index].todayCases}"),
                                  Text("Active Cases : ${countryData[index].active}"),
                                  Text("Critical Cases : ${countryData[index].critical}"),
                                  Text("Total Death : ${countryData[index].deaths}"),
                                  Text("Total Recovered : ${countryData[index].todayDeaths}"),
                                  Text("Today Recovered: ${countryData[index].todayRecovered}"),
                                  Text("Tests : ${countryData[index].tests}"),
                                  Text("continent : ${countryData[index].continent}"),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    else
                    {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ),


            ],
          ),
        ),
      ),
    );
  }
}

