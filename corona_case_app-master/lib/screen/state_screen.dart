import 'package:corona_case_app/model/state_modal.dart';
import 'package:corona_case_app/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/Api_utils.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({Key? key}) : super(key: key);

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {

  final stateSearchText = ValueNotifier("");
 HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: Text("State Wise Cases",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back,
          color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
          child: Column(
            children: [

              // TextFormField
              TextFormField(
                controller: BaseUrl.stateText,
                onChanged: (val){
                  setState(() {
                    stateSearchText.value= val;
                  });
                },
                decoration: InputDecoration(
                    suffix: GestureDetector(
                      onTap: (){
                        setState(() {
                          BaseUrl.stateText.clear();
                        });
                      },
                      child: const Icon(CupertinoIcons.clear_circled_solid,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Search State",
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

              Expanded(
                  child:
                  FutureBuilder(
                    future: httpService.getStateDataResponse(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData)
                      {
                        List<DataState> stateData = snapshot.data!;
                        return (stateSearchText.value != "") ?
                        ListView.builder(
                          itemCount: stateData.length,
                          itemBuilder: (context,index){
                            return (stateData[index].province.toString().toUpperCase().contains(stateSearchText.value.toUpperCase())) ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: ExpansionTile(
                                  tilePadding: const EdgeInsets.symmetric(horizontal: 15),
                                  title: Text("${stateData[index].province}".substring(9), style: GoogleFonts.poppins(color: Colors.black),),
                                  subtitle: Text("${stateData[index].date}".substring(0,10),style: GoogleFonts.poppins(color: Colors.grey.shade200),),
                                  expandedAlignment: Alignment.centerLeft,
                                  childrenPadding: const EdgeInsets.all(10),
                                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Cases : ${stateData[index].confirmed}"),
                                    Text("Active Cases : ${stateData[index].active}"),
                                    Text("Recovered : ${stateData[index].recovered}"),
                                    Text("Deaths : ${stateData[index].deaths}"),
                                  ],
                                ),
                              ),
                            ) : Container();
                          },
                        ) :
                        ListView.builder(
                          itemCount: stateData.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: ExpansionTile(
                                  tilePadding: const EdgeInsets.symmetric(horizontal: 15),
                                  title: Text("${stateData[index].province}".substring(9), style: GoogleFonts.poppins(color: Colors.black),),
                                  subtitle: Text("${stateData[index].date}".substring(0,10),style: GoogleFonts.poppins(color: Colors.grey.shade200),),
                                  expandedAlignment: Alignment.centerLeft,
                                  childrenPadding: const EdgeInsets.all(10),
                                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Cases : ${stateData[index].confirmed}"),
                                    Text("Active Cases : ${stateData[index].active}"),
                                    Text("Recovered : ${stateData[index].recovered}"),
                                    Text("Deaths : ${stateData[index].deaths}"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ) ;
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
