import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key,required this.doctorInfo}) : super(key: key); // Corrected constructor syntax
  final Map doctorInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 349,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorInfo["name"],
              style: GoogleFonts.manrope(fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              doctorInfo["category"],
              style: GoogleFonts.manrope(color: Color(0xff064E57),fontSize: 18,
                fontWeight: FontWeight.w500,),
            ),

            Row(
              children: [
                Text(
                    "${doctorInfo["rate"]}",
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                ),
                RatingBar.readOnly(
                  isHalfAllowed: true,
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  halfFilledColor: Color(0xffFFC107),
                  halfFilledIcon: Icons.star_half,
                  initialRating: doctorInfo["rate"] *1.0,
                  maxRating: 5,
                ),
                Text(
                  "(1 reviews)",
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff868889)
                  ),
                ),
              ],
            ),
            Row(
              children: [
       Icon(Icons.watch_later_outlined,color: Colors.black,size: 18,),
                Text(
                  "Monday - Friday at 8.00 am - 5.00pm",
                  style:GoogleFonts.manrope(color: Color(0xff064E57),fontSize: 10,
                    fontWeight: FontWeight.w400,) ,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container
                      (
                      width: 10.0, // Adjust the width as needed
                      height: 10.0, // Adjust the height as needed
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff868889), // Adjust the color as needed
                      ),
                      child: Center(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white, // Adjust the icon color as needed
                          size: 10.0, // Adjust the icon size as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),


                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("6th October",style: GoogleFonts.manrope(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA6A6A6),
                        ),),
                        GestureDetector(
                         onTap: (){},
                          child: Text(
                              "View on Maps",
                              style: GoogleFonts.manrope(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff70D6D1)
                              )
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),

            Text(
              "200 EGP for an Appointment",
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w500,
color: Color(0xff5CB15A)
            ),
            ),

          ],
        ),
      ),
    );
  }
}
