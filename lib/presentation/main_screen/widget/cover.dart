import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cover extends StatelessWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                width:width* .1111111111111111,
              ),
              Text(
                "Hello, Human!",
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                width: width *.1666666666666667,
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 7.0,
                      ),
                      child: SizedBox(
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.my_location,
                          color: Color(0xff70D6D1),
                          size: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Cairo",
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6A778B),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 400,
          child: Image.asset(
            "images/Frame3860.png",
            width: 400,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
