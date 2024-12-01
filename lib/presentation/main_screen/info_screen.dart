import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../calendaer.dart';
import 'widget/doctor_info.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key,required this.doctorInfo}) : super(key: key); // Corrected constructor syntax
  final Map <String,dynamic>doctorInfo;
  @override

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Color(0xffFFFFFF),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(); // Changed to pop instead of pushNamed
          },
        ),
        backgroundColor: Color(0xff81ECFF).withOpacity(.25),
        actions: [
          Text(
            doctorInfo["name"],
            style: GoogleFonts.manrope(
              color: Color(0xffFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: width*.4166666666666667,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              doctorInfo["image"],
              fit: BoxFit.cover,
              width: double.infinity,

            ),
            Padding(
              padding:  EdgeInsets.only(top: height*.35),
              child: Image.asset("images/doctor_info_back_ground.png"),
            ),
            Padding(
              padding:  EdgeInsets.only(top: .4375*height, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DoctorInfo(doctorInfo:doctorInfo),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 20,
                    width:
                    width*.9555555555555556,
                    child: Text(
                      doctorInfo["pio"],
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff191919),
                      ),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 40, left: 30),
                    child: Container(
                      width: 400,
                      height: height*.0625,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff70D6D1),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomCalendar(doctorMap: doctorInfo, onLocaleChanged: (Locale value) {  },))); // Changed to MaterialPageRoute
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Book an Appointment",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Image.asset("images/deadline (1) 1.png"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
