import 'package:corona_case_app/model/summary_modal.dart';
import 'package:corona_case_app/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    colors txtcolor = Colors.white;
    colors bgcolor = Colors.black;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
              child: Text("Covid - 19 Cases",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 22,
                    letterSpacing: 0.5
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: Text("World Wise Cases",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                    fontSize: 18,
                    letterSpacing: 0.5
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: FutureBuilder(
                future: httpService.getSummaryDataResponse(),
                builder: (context, snapshot) {
                  if(snapshot.hasData)
                    {
                      List<Global> posts = snapshot.data!;
                      return ListView.builder(
                        itemCount: posts.length,
                          itemBuilder: (context,index){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                // Date

                                Container(
                                  height: 60,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 10,
                                        offset: Offset(1,4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Date",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text("${posts[index].date}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // New Confirmed Case
                                const SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 10,
                                        offset: Offset(1,4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("New Confirmed Case : ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text("${posts[index].newConfirmed}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Total Confirmed Case

                                const SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 10,
                                        offset: Offset(1,4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Confirmed Case : ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text("${posts[index].totalConfirmed}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // New Deaths Case

                                const SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 10,
                                        offset: Offset(1,4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("New Deaths Case : ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text("${posts[index].newDeaths}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Total Deaths Case

                                const SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 10,
                                        offset: Offset(1,4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Deaths Case : ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text("${posts[index].totalDeaths}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // New Recovered Case

                                const SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 10,
                                        offset: Offset(1,4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("New Recovered Case : ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text("${posts[index].newRecovered}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Total Recovered Case

                                const SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 10,
                                        offset: Offset(1,4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Recovered Case : ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text("${posts[index].totalRecovered}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                                // Country / State Wise Cases

                                const SizedBox(height: 60,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, 'country');
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 380,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          blurRadius: 10,
                                          offset: Offset(1,4),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(" Country / State Wise Cases",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
